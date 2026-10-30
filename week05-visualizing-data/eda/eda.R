library(ggplot2)

source_url <- "https://raw.githubusercontent.com/Vadimkin/ukrainian-air-raid-sirens-dataset/refs/heads/main/datasets/official_data_en.csv"
snapshot_date <- as.Date("2026-10-22")
record_dates <- as.Date(c("2022-03-15", "2026-09-07"))
total_records <- 299275L

alerts_by_region <- data.frame(
  oblast = c("Dnipropetrovska oblast", "Kharkivska oblast", "Donetska oblast", "Zaporizka oblast",
  "Sumska oblast", "Poltavska oblast", "Mykolaivska oblast", "Chernihivska oblast",
  "Odeska oblast", "Khersonska oblast", "Kirovohradska oblast", "Kyivska oblast", "Cherkaska oblast",
  "Vinnytska oblast", "Zhytomyrska oblast", "Kyiv City", "Khmelnytska oblast", "Rivnenska oblast",
  "Lvivska oblast", "Ivano-Frankivska oblast", "Volynska oblast", "Ternopilska oblast",
  "Zakarpatska oblast", "Chernivetska oblast", "Luhanska oblast"),
  total_alerts = c(45729L, 39651L, 28117L, 26744L, 21036L, 15988L, 15699L, 14899L, 13238L, 12648L,
  11743L, 10951L, 10370L, 5021L, 4711L, 4141L, 2938L, 2742L, 2380L, 2228L, 2169L, 2134L,
  2051L, 1945L, 2L),
  stringsAsFactors = FALSE
)

region_layout <- data.frame(
  oblast = c(
    "Volynska oblast", "Rivnenska oblast", "Zhytomyrska oblast",
    "Chernihivska oblast", "Sumska oblast", "Lvivska oblast",
    "Ternopilska oblast", "Khmelnytska oblast", "Kyivska oblast",
    "Kyiv City", "Poltavska oblast", "Kharkivska oblast", "Luhanska oblast",
    "Zakarpatska oblast", "Ivano-Frankivska oblast", "Chernivetska oblast",
    "Vinnytska oblast", "Cherkaska oblast", "Kirovohradska oblast",
    "Dnipropetrovska oblast", "Donetska oblast", "Odeska oblast",
    "Mykolaivska oblast", "Khersonska oblast", "Zaporizka oblast",
    "Autonomous Republic of Crimea", "Sevastopol City"
  ),
  region_name = c(
    "Volyn Oblast", "Rivne Oblast", "Zhytomyr Oblast", "Chernihiv Oblast",
    "Sumy Oblast", "Lviv Oblast", "Ternopil Oblast", "Khmelnytskyi Oblast",
    "Kyiv Oblast", "Kyiv City", "Poltava Oblast", "Kharkiv Oblast",
    "Luhansk Oblast", "Zakarpattia Oblast", "Ivano-Frankivsk Oblast",
    "Chernivtsi Oblast", "Vinnytsia Oblast", "Cherkasy Oblast",
    "Kirovohrad Oblast", "Dnipropetrovsk Oblast", "Donetsk Oblast",
    "Odesa Oblast", "Mykolaiv Oblast", "Kherson Oblast", "Zaporizhzhia Oblast",
    "Autonomous Republic of Crimea", "Sevastopol City"
  ),
  map_name = c(
    "Volyn", "Rivne", "Zhytomyr", "Chernihiv", "Sumy", "Lviv",
    "Ternopil", "Khmelnytskyi", "Kyiv Oblast", "Kyiv City", "Poltava",
    "Kharkiv", "Luhansk", "Zakarpattia", "Ivano-\nFrankivsk", "Chernivtsi",
    "Vinnytsia", "Cherkasy", "Kirovohrad", "Dnipropetrovsk", "Donetsk",
    "Odesa", "Mykolaiv", "Kherson", "Zaporizhzhia", "Crimea", "Sevastopol"
  ),
  column = c(1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 6, 7,
             0, 1, 2, 3, 4, 5, 6, 7, 3, 4, 5, 6, 6, 5),
  row = c(rep(0, 5), rep(1, 8), rep(2, 8), rep(3, 4), 4, 5)
)

unknown_regions <- setdiff(alerts_by_region$oblast, region_layout$oblast)
if (length(unknown_regions) > 0) {
  stop(paste("Add these regions to region_layout:",
             paste(unknown_regions, collapse = ", ")))
}

hex_map <- merge(
  region_layout, alerts_by_region,
  by = "oblast", all.x = TRUE, sort = FALSE
)

stopifnot(
  nrow(hex_map) == 27,
  !anyDuplicated(hex_map$oblast),
  !anyDuplicated(hex_map[c("column", "row")]),
  sum(hex_map$total_alerts, na.rm = TRUE) == total_records
)

hex_map$x <- sqrt(3) * (hex_map$column + 0.5 * (hex_map$row %% 2))
hex_map$y <- -1.5 * hex_map$row

format_count <- function(x) {
  format(x, big.mark = ",", scientific = FALSE, trim = TRUE)
}

hex_map$tile_label <- paste(
  hex_map$map_name,
  ifelse(is.na(hex_map$total_alerts), "No records", format_count(hex_map$total_alerts)),
  sep = "\n"
)

alert_colour <- scales::col_numeric(
  palette = c("#238443", "#A1D76A", "#FFFFBF", "#FCAE61", "#D73027"),
  domain = range(alerts_by_region$total_alerts),
  na.color = "#D9D9D9"
)

hex_map$fill_colour <- alert_colour(hex_map$total_alerts)
rgb_values <- col2rgb(hex_map$fill_colour)
brightness <- 0.299 * rgb_values[1, ] +
  0.587 * rgb_values[2, ] + 0.114 * rgb_values[3, ]
hex_map$text_colour <- ifelse(brightness < 140, "white", "#222222")

angles <- (30 + 60 * (0:5)) * pi / 180
hexagons <- data.frame()

for (i in seq_len(nrow(hex_map))) {
  hexagon <- data.frame(
    oblast = hex_map$oblast[i],
    x = hex_map$x[i] + 0.96 * cos(angles),
    y = hex_map$y[i] + 0.96 * sin(angles)
  )
  hexagons <- rbind(hexagons, hexagon)
}

legend_data <- hex_map[order(-hex_map$total_alerts, na.last = TRUE), ]

legend_data$legend_label <- ifelse(
  is.na(legend_data$total_alerts),
  paste(legend_data$region_name, "- no records"),
  paste(legend_data$region_name, "-", format_count(legend_data$total_alerts))
)
region_colours <- setNames(legend_data$fill_colour, legend_data$oblast)

period_label <- paste(format(range(record_dates), "%Y-%m-%d"), collapse = " to ")


if (requireNamespace("bbplot", quietly = TRUE)) {
  bbc_theme <- suppressWarnings(bbplot::bbc_style())
} else {
  bbc_theme <- theme_minimal(base_family = "sans")
}

bbc_theme$legend.text.align <- NULL

visualization <- ggplot(hexagons, aes(x = x, y = y, group = oblast)) +
  geom_polygon(aes(fill = oblast), colour = "white", linewidth = 0.5) +
  geom_text(
    data = hex_map,
    aes(x = x, y = y, label = tile_label, colour = text_colour),
    inherit.aes = FALSE, show.legend = FALSE,
    family = "sans", size = 3.2, lineheight = 1.05
  ) +
  scale_colour_identity() +
  scale_fill_manual(
    values = region_colours,
    breaks = legend_data$oblast,
    labels = legend_data$legend_label,
    name = "Region - total records\nGreen: fewer | Red: more",
    guide = guide_legend(ncol = 1, override.aes = list(colour = NA))
  ) +
  coord_equal(clip = "off", expand = TRUE) +
  labs(
    title = "Air raid alerts across Ukraine",
    subtitle = paste0(
      format_count(total_records), " official records by region\n",
      period_label, " (UTC) | One hexagon per region"
    ),
    x = NULL,
    y = NULL,
    caption = paste(
      paste0("Source: Vadimkin/ukrainian-air-raid-sirens-dataset - official_data_en.csv. Snapshot: ", snapshot_date, "."),
      "Counts include oblast, district and hromada records; simultaneous local alerts are counted separately.",
      "Permanent alerts in Luhansk and Crimea are omitted from the source. Grey means no records, not zero alerts.",
      "Hexagon positions are schematic. Counts describe recorded announcements, not regional safety.",
      sep = "\n"
    )
  ) +
  bbc_theme +
  theme(
    text = element_text(family = "sans"),
    plot.title = element_text(family = "sans", size = 27, face = "bold", margin = margin(b = 10)),
    plot.subtitle = element_text(family = "sans", size = 14, lineheight = 1.2, margin = margin(b = 16)),
    plot.caption = element_text(family = "sans", size = 9, hjust = 0, lineheight = 1.25),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.background = element_rect(fill = "white", colour = NA),
    plot.margin = margin(20, 24, 16, 20),
    panel.grid = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.text = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    legend.position = "right",
    legend.direction = "vertical",
    legend.title = element_text(family = "sans", size = 11, face = "bold", margin = margin(b = 10)),
    legend.text = element_text(family = "sans", size = 10),
    legend.key.height = grid::unit(5.4, "mm"),
    legend.key.width = grid::unit(6, "mm"),
    legend.margin = margin(l = 14)
  )

if (interactive()) {
  print(visualization)
}

ggsave(
  "visualization.png",
  plot = visualization,
  width = 16,
  height = 10,
  units = "in",
  dpi = 160,
  bg = "white"
)

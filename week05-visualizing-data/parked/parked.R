library(tidyverse)

# Read the lyrics
lyrics <- read_file("lyrics/summerwind.txt")

# Normalize capitalization, punctuation, and whitespace
lyrics <- lyrics |>
  str_to_lower() |>
  str_replace_all("['’]", "") |>
  str_replace_all("[[:punct:]]", " ") |>
  str_squish()

# Split the text into individual words
words <- str_split_1(lyrics, " ")

# Create a table of word occurrences
word_data <- data.frame(word = words)

word_data <- word_data |>
  filter(word != "")

# Count occurrences of each word
word_counts <- word_data |>
  group_by(word) |>
  summarize(count = n()) |>
  ungroup() |>
  arrange(desc(count))

# Select words for the visualization
plot_data <- word_counts |>
  filter(count > 1) |>
  slice_head(n = 15) |>
  arrange(count)

# Set the order of the word labels
plot_data$word <- factor(
  plot_data$word,
  levels = plot_data$word
)

# Build and display the plot
p <- ggplot(
  plot_data,
  aes(x = count, y = word)
) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Most frequent words in the song",
    subtitle = "Words appearing at least twice; up to 15 words",
    x = "Number of occurrences",
    y = "Word"
  ) +
  theme_classic()

print(p)

# Save the plot
ggsave(
  "lyrics.png",
  plot = p,
  width = 1600,
  height = 1000,
  units = "px",
  dpi = 150
)
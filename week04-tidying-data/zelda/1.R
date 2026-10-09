library(tidyverse)

zelda <- read_csv("zelda.csv")

zelda$role <- str_to_lower(zelda$role)

zelda$year <- as.integer(
  str_sub(zelda$release, start = 1, end = 4)
)

zelda$system <- str_sub(
  zelda$release,
  start = 8
)

zelda <- zelda |>
  pivot_wider(
    id_cols = c(title, year, system),
    names_from = role,
    values_from = names
  ) |>
  select(
    title,
    year,
    system,
    directors,
    producers,
    designers,
    programmers,
    writers,
    composers,
    artists
  )

save(zelda, file = "zelda.RData")
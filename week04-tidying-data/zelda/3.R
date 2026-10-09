library(tidyverse)

load("zelda.RData")

zelda <- zelda |>
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  arrange(year, title, system)

save(zelda, file = "3.RData")
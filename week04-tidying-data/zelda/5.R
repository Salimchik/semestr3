library(tidyverse)

load("zelda.RData")

zelda <- zelda |>
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  filter(str_detect(producers, ",")) |>
  arrange(year, title, system)

save(zelda, file = "5.RData")
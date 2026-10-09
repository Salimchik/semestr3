library(tidyverse)

load("air.RData")

air <- air |>
  group_by(level_1, pollutant) |>
  summarize(emissions = sum(emissions)) |>
  ungroup() |>
  select(
    source = level_1,
    pollutant,
    emissions
  ) |>
  arrange(source, pollutant)

save(air, file = "7.RData")
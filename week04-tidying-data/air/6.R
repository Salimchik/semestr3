library(tidyverse)

load("air.RData")

air <- air |>
  group_by(pollutant) |>
  summarize(emissions = sum(emissions)) |>
  ungroup() |>
  arrange(desc(emissions))

save(air, file = "6.RData")
library(tidyverse)

load("air.RData")

air <- air |>
  group_by(county) |>
  arrange(desc(emissions)) |>
  slice_head(n = 1) |>
  ungroup() |>
  arrange(desc(emissions))

save(air, file = "5.RData")
tests <- read.table(
  "tests.tsv",
  header = TRUE,
  sep = "\t",
  stringsAsFactors = FALSE
)

tests$gender <- ifelse(
  tests$gender == 0,
  "Unanswered",
  ifelse(
    tests$gender == 1,
    "Male",
    ifelse(
      tests$gender == 2,
      "Female",
      "Other"
    )
  )
)

tests$extroversion <- round(
  (tests$E1 + tests$E2 + tests$E3) / 15,
  2
)

tests$neuroticism <- round(
  (tests$N1 + tests$N2 + tests$N3) / 15,
  2
)

tests$agreeableness <- round(
  (tests$A1 + tests$A2 + tests$A3) / 15,
  2
)

tests$conscientiousness <- round(
  (tests$C1 + tests$C2 + tests$C3) / 15,
  2
)

tests$openness <- round(
  (tests$O1 + tests$O2 + tests$O3) / 15,
  2
)

write.csv(
  tests,
  "analysis.csv",
  row.names = FALSE
)
# Ask for a country
country <- readline("Country: ")

# Process each year
for (year in 2020:2024) {
  filename <- paste0(year, ".csv")
  happiness <- read.csv(filename)
  
  if (country %in% happiness$country) {
    # Exclude the country column
    factors <- happiness[, -1]
    
    # Sum the factors for each country
    scores <- apply(
      factors,
      MARGIN = 1,
      FUN = sum
    )
    
    # Select and round the requested country's score
    score <- scores[happiness$country == country]
    score <- round(score, 2)
    
    cat(paste0(year, ": ", score, "\n"))
  } else {
    cat(paste0(year, ": unavailable\n"))
  }
}
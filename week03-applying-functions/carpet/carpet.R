calculate_growth_rate <- function(years, visitors) {
  first_year <- min(years)
  last_year <- max(years)
  
  first_visitors <- visitors[years == first_year]
  last_visitors <- visitors[years == last_year]
  
  visitor_difference <- last_visitors - first_visitors
  year_difference <- last_year - first_year
  
  growth_rate <- visitor_difference / year_difference
  
  return(growth_rate)
}

predict_visitors <- function(years, visitors, year) {
  growth_rate <- calculate_growth_rate(years, visitors)
  
  last_year <- max(years)
  last_visitors <- visitors[years == last_year]
  
  years_ahead <- year - last_year
  
  prediction <- last_visitors + growth_rate * years_ahead
  
  return(prediction)
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))

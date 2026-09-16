# Read bus and rail reliability data.
bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")

# Combine bus and rail observations into one data frame.
services <- rbind(bus, rail)

# Inspect the available routes and peak-hour categories.
unique(services$route)
unique(services$peak)

# Calculate reliability for every service observation.
services$reliability <- services$numerator / services$denominator

# Ask the user which route they intend to take.
route <- readline("Route: ")

if (!(route %in% services$route)) {
  print("Please enter a valid route.")
} else {
  # Select observations belonging to the requested route.
  route_filter <- services$route == route
  route_services <- services[route_filter, ]
  
  # Select observations from peak hours.
  peak_filter <- route_services$peak == "PEAK"
  peak_services <- route_services[peak_filter, ]
  
  # Select observations from off-peak hours.
  off_peak_filter <- route_services$peak == "OFF_PEAK"
  off_peak_services <- route_services[off_peak_filter, ]
  
  # Calculate the mean reliability during peak hours.
  peak_reliability <- mean(
    peak_services$reliability,
    na.rm = TRUE
  )
  
  # Calculate the mean reliability during off-peak hours.
  off_peak_reliability <- mean(
    off_peak_services$reliability,
    na.rm = TRUE
  )
  
  # Convert the means to rounded percentages.
  peak_percentage <- round(peak_reliability * 100)
  off_peak_percentage <- round(off_peak_reliability * 100)
  
  # Display both results.
  print(
    paste0(
      route,
      " is on time ",
      peak_percentage,
      "% of the time during peak hours."
    )
  )
  
  print(
    paste0(
      route,
      " is on time ",
      off_peak_percentage,
      "% of the time during off-peak hours."
    )
  )
}
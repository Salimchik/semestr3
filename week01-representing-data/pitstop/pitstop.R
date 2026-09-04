filename <- readline(prompt = "File: ")

data <- read.csv(filename)

total_stops <- nrow(data)
shortest_time <- min(data$time)
longest_time <- max(data$time)
total_time <- sum(data$time)

print(total_stops)
print(shortest_time)
print(longest_time)
print(total_time)
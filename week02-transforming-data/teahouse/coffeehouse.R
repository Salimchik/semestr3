# Ask the user about their coffee preferences.
temperature <- readline("Temperature (Hot or Cold): ")
milk <- readline("Milk (Yes or No): ")

if (!(temperature == "Hot" || temperature == "Cold")) {
  print("Please enter Hot or Cold for temperature.")
} else if (!(milk == "Yes" || milk == "No")) {
  print("Please enter Yes or No for milk.")
} else if (temperature == "Hot" && milk == "Yes") {
  print("I recommend latte.")
} else if (temperature == "Hot" && milk == "No") {
  print("I recommend espresso")
} else if (temperature == "Cold" && milk == "Yes") {
  print("I recommend iced latte")
} else {
  print("I recommend cold brew")
}
# Ask the user for their preferences.
flavor <- readline("Flavor (Light or Bold): ")
caffeine <- readline("Caffeine (Yes or No): ")

# Validate the flavor and caffeine, then recommend a tea.
if (!(flavor == "Light" || flavor == "Bold")) {
  print("Please enter Light or Bold for flavor.")
} else if (!(caffeine == "Yes" || caffeine == "No")) {
  print("Please enter Yes or No for caffeine.")
} else if (flavor == "Light" && caffeine == "Yes") {
  print("I recommend green tea.")
} else if (flavor == "Bold" && caffeine == "Yes") {
  print("I recommend black tea.")
} else if (flavor == "Light" && caffeine == "No") {
  print("I recommend chamomile tea.")
} else {
  print("I recommend rooibos tea.")
}
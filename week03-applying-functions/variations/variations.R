# Return one random lowercase letter
random_character <- function() {
  character <- sample(letters, size = 1)
  return(character)
}

# Print a sequence with a pause after each character
print_sequence <- function(length) {
  for (i in 1:length) {
    character <- random_character()
    cat(character)
    Sys.sleep(0.25)
  }
  
  cat("\n")
}

# Print 20 random letters
print_sequence(20)
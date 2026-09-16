# Read information about the books and authors.
books <- read.csv("books.csv")
authors <- read.csv("authors.csv")

# Inspect the structure and column names of both data frames.
colnames(books)
colnames(authors)

head(books)
head(authors)

# Discover the exact topic names used in the data.
unique(books$topic)

# The Writer
# Find all books written by Mia Morgan to identify her only book.
writer_filter <- books$author == "Mia Morgan"
writer_result <- books[writer_filter, ]

writer_result
writer_result$title

# The Musician
# Find a book about music that was published in 1613.
musician_filter <- books$topic == "Music" & books$year == 1613

musician_result <- books[musician_filter, ]

musician_result
musician_result$title

# The Traveler
# Search for a book published in 1775 by either of the two possible authors.
traveler_filter <- books$author %in% c(
  "Lysandra Silverleaf",
  "Elena Petrova"
) & books$year == 1775

traveler_result <- books[traveler_filter, ]

traveler_result
traveler_result$title

# The Painter
# Find an art book with 200 to 300 pages published in either 1990 or 1992.
painter_filter <- books$topic == "Art" &
  books$pages >= 200 &
  books$pages <= 300 &
  books$year %in% c(1990, 1992)

painter_result <- books[painter_filter, ]

painter_result
painter_result$title

# The Scientist
# Find a book whose title contains the words "Quantum Mechanics".
scientist_filter <- grepl(
  "Quantum Mechanics",
  books$title
)

scientist_result <- books[scientist_filter, ]

scientist_result
scientist_result$title

# The Teacher
# First, identify all authors whose hometown is Zenthia.
zenthia_filter <- authors$hometown == "Zenthia"
zenthia_authors <- authors[zenthia_filter, ]

zenthia_authors
zenthia_authors$author

# Use the authors from Zenthia to find an education book published in the 1700s.
teacher_filter <- books$author %in% zenthia_authors$author &
  books$topic == "Education" &
  books$year >= 1700 &
  books$year <= 1799

teacher_result <- books[teacher_filter, ]

teacher_result
teacher_result$title
library(ggplot2);library(dplyr);library(stringr);library(stringi);library(readr);library(rebus)



# Data camp example -------------------------------------------------------

# count how many times thos different charcter has a line in the play

stringi::stri_read_lines("https://assets.datacamp.com/production/course_2922/datasets/importance-of-being-earnest.txt")

earnest <- readLines("https://assets.datacamp.com/production/course_2922/datasets/importance-of-being-earnest.txt")

# Detect start and end lines
start <- str_which(earnest, fixed("START OF THE PROJECT"))
end <- str_which(earnest, fixed("END OF THE PROJECT"))

# Get rid of gutenberg intro text
earnest_sub  <- earnest[(start + 1):(end - 1)]

# Detect first act
lines_start <- str_which(earnest_sub, fixed("FIRST ACT"))

# Set up index
intro_line_index <- 1:(lines_start - 1)

# Split play into intro and play
intro_text <- earnest_sub[intro_line_index]
play_text <- earnest_sub[-intro_line_index]

# Take a look at the first 20 lines
writeLines(head(play_text, n = 20))


# Part 2 ------------------------------------------------------------------

# Get ride of the empty space
empty <- stri_isempty(play_text)
play_lines <- play_text[!empty]

# Pattern for start, word then .
pattern_1 <- START %R% one_or_more(WRD) %R% DOT

# Test pattern_1
str_view(play_lines, pattern_1, match = T) 
str_view(play_lines, pattern_1, match = F)

# Pattern: Try a more specific pattern: the start of the line, a capital letter, followed by one or more word characters, then a full stop.

# Pattern for start, capital, word then .
pattern_2 <-START %R% ascii_upper() %R% WRD %R% DOT

# Test pattern_2
str_view(play_lines, pattern_2, match = T)
str_view(play_lines, pattern_2, match = F)

# Pattern from last step
pattern_2 <- START %R% ascii_upper() %R% one_or_more(WRD) %R% DOT

# Get subset of lines that match
lines <- str_subset(play_lines, pattern_2)

# Extract match from lines
who <- str_extract(lines, pattern_2)

# Let's see what we have
unique(who)



# Part 3 ------------------------------------------------------------------

# Create vector of characters
characters <- c("Algernon", "Jack", "Lane", "Cecily", "Gwendolen", "Chasuble", 
                "Merriman", "Lady Bracknell", "Miss Prism")

# Match start, then character name, then .
pattern_3 <- START %R% or1(characters) %R% DOT

# View matches of pattern_3
str_view(play_lines , pattern_3, match = T)

# View non-matches of pattern_3
str_view(play_lines, pattern_3, match = F)


# Variables from previous step
characters <- c("Algernon", "Jack", "Lane", "Cecily", "Gwendolen", "Chasuble", 
                "Merriman", "Lady Bracknell", "Miss Prism")
pattern_3 <- START %R% or1(characters) %R% DOT

# Pull out matches
lines <- str_subset(play_lines, pattern_3)

# Extract match from lines
who <- str_extract(lines, pattern_3)

# Let's see what we have
unique(who)

# Count lines per character
table(who)





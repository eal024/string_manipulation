
# library   
library(tidyverse)

# Basic regex -------------------------------------------------------------

exmp <- c("abc ABC 123'\'.!?(){}")

df <- tibble( navn = c("Eilif Lamøy", "Trond Vegard Lamøy","Eirik Lamøy", "Trond Hansen", "Benjamin Heitmanni"), fodt = c(1964,1980,1984, 1969, 2001) )

# spes. char after \
str_view(exmp, pattern = "a")
str_view(exmp, pattern = "\\.")
str_view(exmp, pattern = "\\!")
str_view(exmp, pattern = "\\?")

# words
str_view_all(exmp, pattern = "[:alpha:]")
str_view_all(exmp, pattern = "[:digit:]");
str_view_all(exmp, pattern = "\\d")
str_view_all(exmp, pattern = "\\b")


# Look arounds:
  # letter followed by space
str_view_all(exmp, pattern = "\\w(?=\\s)")
  # letter after space
str_view_all(exmp, pattern = "(?<=\\s)\\w")


# Non-
str_view_all(exmp, pattern = "\\S")
# non-digits
str_view_all(exmp, pattern = "\\D")
# non-letters
str_view_all(exmp, pattern = "\\D")
str_view_all(exmp, pattern = "[A-Za-z]")
str_view_all(exmp, pattern = "[A-Za-z]")




# Alternates --------------------------------------------------------------

#or
str_view_all(exmp, pattern = "ab|AB")
#one of:
str_view_all(exmp, pattern = "[acAC]")
#range and - anything but[a-b]
str_view_all(exmp, pattern = "[^a-b]")



# Anchors -----------------------------------------------------------------
str_view( exmp, pattern = "a")
str_view( exmp , pattern = "[a-z](?=\\s)")

str_detect( df$fodt , pattern = "^1")

str_extract_all( df$fodt , pattern = "^2[0-9]{3}")

str_extract_all( df$navn , pattern = "\\w...y$")

str_extract_all( df$navn , pattern = "\\w+(n|y)$")



# look arounds ------------------------------------------------------------
str_view_all( exmp, pattern =  "(b|B)(?=c|C)")


# Preceded by
str_view_all( exmp, pattern = "(?<=\\s)\\w")

# Two letters preceded after whitespace
str_view_all( exmp, pattern = "(?<=\\s)\\w{2}")

# word Not preced after whitespace (any lenght)
str_view_all( exmp, pattern = "(?<!\\s)\\w+")



# Quantifiers -------------------------------------------------------------

# Zero or one (gives where no spaces)
str_view_all( exmp, pattern = "\\w?")

# Zero or more
str_view( exmp, pattern = "a")
































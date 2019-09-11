
library(tidyverse);library(rebus)

# char classes ------------------------------------------------------------

# Match one of the following characters:

char_class()


vowels <- char_class( "aeiouAEIOU")

print(vowels)

x <- c("cat", "coat", "scotland", "tic toc")


str_view_all( x, pattern =  vowels)

# Antall vowels in boysnames

num_vowels <- str_count(boy_name_string, vowels )

mean(num_vowels)

# Andel

mean( mean(num_vowels)/str_length((boy_name_string)) ) 
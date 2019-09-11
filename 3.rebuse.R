library(rebus);library(stringr);library(tidyverse);



# Rebus - package ---------------------------------------------------------

boynames <- c("alla", "boyam", "nille", "truls", "sigge", "banan")


str_view(c("hello", "sweet", "kitten"), 
         pattern = capture(LOWER) %R% REF1)



# Navn med to like (etterhvernadre)
pattern <- capture(LOWER) %R% REF1


str_view( boynames, pattern = pattern)


# repitering av to bokstaver.


pattern <- capture(LOWER %R% LOWER) %R% REF1

str_view( boynames, pattern = pattern)
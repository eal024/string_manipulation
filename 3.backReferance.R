
library(tidyverse);library(rebus);library(stringr)

# BackRef -----------------------------------------------------------------

# Rebus - tilbake-referanse.
rebus::REF1
rebus::REF2



pattern <- SPC %R% one_or_more(WRD) %R% SPC

str_view("Paris is in the the wind", pattern = pattern)


pattern <- SPC %R% capture( one_or_more(WRD) ) %R% SPC %R% REF1

str_view("Paris is in the the  wind", pattern = pattern)

# Example:
str_view(c("hello", "sweet", "kitten"),   pattern = capture(LOWER) %R% REF1 )


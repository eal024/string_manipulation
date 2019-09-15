

library(stringi);library(stringr)

# Get first five catcidents
cat5 <- catcidents[1:5]

# Take a look at original
writeLines(cat5)

# Transform to title case
writeLines(str_to_lower(cat5))

# Transform to title case with stringi
writeLines(stri_trans_totitle(cat5) )

# Transform to sentence case with stringi
writeLines( stri_trans_totitle(cat5, type = "sentence"))



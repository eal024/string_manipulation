library(babynames);library(tidyverse);library(rebus);library(stringr)

boy_names <- babynames::babynames %>% filter(sex == "M") %>% head(n = 20) %>% pull(name)

# Vowels from last exercise
vowels <- char_class("aeiouAEIOU")

# See names with only vowels
str_view(boy_names,
         pattern = rebus::one_or_more(exactly(vowels)),
         match = TRUE) 


# Use `negated_char_class()` for everything but vowels
not_vowels <- negated_char_class("aeiouAEIOU")

# See names with no vowels
str_view(boy_names, 
         pattern = zero_or_more(not_vowels), 
         match = TRUE)


# Short cut:
# Finne et tall:
# $[0123456789]


tekst_med_tall <- c("en mann Onsket A betale 100963 kr")

str_extract_all(tekst_med_tall, "[$0123]")

# snarvei tall
str_extract_all(tekst_med_tall, "[0-9]")


# Snarvei bokstaver

str_extract_all(tekst_med_tall, "[A-Z]")

# Andre nyttige snarveier:

#' digits: \d
#' any words: \w
#' whitspace: \s
#' 
#' 
#' 



# Eksempler ---------------------------------------------------------------
strings <- c(
  "apple", 
  "219 733 8965", 
  "329-293-8753", 
  "Work: 579-499-7527; Home: 543.355.3679"
)

# Enkleste søket
str_view_all(strings, pattern = "[0-9]")


# Deles av et bestemt mønster
str_view_all( strings, pattern = rebus::char_class("[().0-9]") )






# Create a separator pattern
separator <- rebus::char_class("[-,.(,)]")

# Test it
str_view_all(contact, pattern = separator)


# Bruk av %R% og lete etter 3-digits:
library(rebus)

three_digits <- DGT %R% DGT %R% DGT; 

foure_digits <- three_digits %R% DGT

# Lete etter telfonnr.
# Use these components

three_digits <- DGT %R% DGT %R% DGT
four_digits <- three_digits %R% DGT
separator <- char_class("-.() ")

# Create phone pattern
phone_pattern <- optional(OPEN_PAREN) %R% 
  three_digits %R% 
  zero_or_more(separator) %R% 
  three_digits %R% 
  zero_or_more(separator) %R%
  four_digits


# Test it           
str_view_all(strings, pattern = phone_pattern)s

# Extract phone numbers
str_extract(strings, phone_pattern)

# Extract ALL phone numbers
str_extract_all(strings, phone_pattern)




# Example 2 ---------------------------------------------------------------

text <- "19YOM-SHOULDER STRAIN-WAS TACKLED WHILE PLAYING FOOTBALL W/
  FRIENDS 31 YOF FELL FROM TOILET HITITNG HEAD SUSTAINING A CHI ANKLE STR.
  82 YOM STRAINED ANKLE GETTING OUT OF BED TRIPPED OVER CAT AND LANDED ON HARDWOOD FLOOR. LACERATION ELBOW, LEFT. 33 YOF"

pattern <- DGT %R% DGT


# Use these patterns
age <- DGT %R% optional(DGT)
unit <- optional(SPC) %R% or("YO", "YR", "MO")
gender <- optional(SPC) %R% or("M", "F")

# Extract age, unit, gender
str_extract_all(text, age %R% unit %R% gender)




# Example 3 ---------------------------------------------------------------
# age_gender, age, gender, unit are pre-defined
ls.str()

# Extract age and make numeric
str_extract(age_gender, age)%>%as.numeric()

# Replace age and units with ""
genders <- str_remove(age_gender, pattern = age %R% unit)

# Replace extra spaces
str_remove_all(genders, pattern = one_or_more(SPC))


#
# Numeric ages, from previous step
ages_numeric <- as.numeric(str_extract(age_gender, age))

# Extract units 
time_units <- str_extract(age_gender, pattern = unit)

# Extract first word character
time_units_clean <- str_extract(age_gender, pattern = "[A-Z]")

# Turn ages in months to years
ifelse(time_units_clean == "Y", ages_numeric, ages_numeric/12)







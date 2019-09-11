


# Capturing ---------------------------------------------------------------

library(rebus);library(stringr);library(tidyverse);

prove_tekst <- "en banan sa stopp til a."

ANY_CHAR %R% "a"

capture(ANY_CHAR)  %R% "a"

str_view_all(prove_tekst, ANY_CHAR %R% "a")

str_view_all(prove_tekst, capture(ANY_CHAR) %R% "a")

dyr <- c("cat", "Fat")

str_match(dyr , pattern =  capture(ANY_CHAR) %R% "a" )

# Eksempel 2:

pattern <-
  DOLLAR %R%
  capture(DGT %R% optional(DGT) ) %R%
  DOT %R%
  capture(dgt(2))

str_match(c("$50.30", "$19.10"), pattern = pattern)



# Non capturing group:

or("dog", "cat")

# En måte å skrive på:
str_view( c("dog", "cat", "bird"), c("dog|cat"))

# En annen  måte:
str_view( c("dog", "cat", "bird"), or("dog", "cat") )


# Example

email <- 
  "@" %R% one_or_more(WRD) %R% 
  DOT %R% one_or_more(WRD)


str_view("(wolverine@xmen.com)", pattern = email)  



# Pattern from previous step
email <- capture(one_or_more(WRD)) %R% 
  "@" %R% capture(one_or_more(WRD)) %R% 
  DOT %R% capture(one_or_more(WRD))

# Pull out match and captures
email_parts <- str_match("(wolverine@xmen.com)", pattern = email) 
email_parts

# Save host
host <- email_parts[,3]
host



# Example 2: phone number -------------------------------------------------

# View text containing phone numbers
contact <-  c("Call me at 555-555-0191", "123 main street", "(555) 555 091", "phone: 543 129 123")

three_digits <- DGT %R% DGT %R% DGT; 
four_digits <- three_digits %R% DGT
separator <- char_class("-.() ")

# Add capture() to get digit parts
phone_pattern <- capture( three_digits ) %R% zero_or_more(separator) %R% 
  capture( three_digits ) %R%  zero_or_more(separator) %R%
  capture( four_digits )

# Pull out the parts with str_match()
phone_numbers <- str_match(contact, patter = phone_pattern)

# Put them back together
str_c("(",
      phone_numbers[,2],
      ") ",
      phone_numbers[,3],
      "-",
      phone_numbers[,4] )




# Capture age from a string  ----------------------------------------------

text <- "19YOM-SHOULDER STRAIN-WAS TACKLED WHILE PLAYING FOOTBALL W/
  FRIENDS 31 YOF FELL FROM TOILET HITITNG HEAD SUSTAINING A CHI ANKLE STR.
  82 YOM STRAINED ANKLE GETTING OUT OF BED TRIPPED OVER CAT AND LANDED ON HARDWOOD FLOOR. LACERATION ELBOW, LEFT. 33 YOF"


# Utgangspunktet.
pattern <- optional(DGT) %R% DGT %R%  
  optional(SPC) %R% or("YO", "YR", "MO") %R%
  optional(SPC) %R% or("M", "F")

str_match(text, pattern = pattern)

# Justert
# narratives has been pre-defined
text

# Edit to capture just Y and M in units
pattern2 <- capture(optional(DGT) %R% DGT) %R%  
  optional(SPC) %R% capture(or("Y", "M")) %R% optional(or("O","R")) %R%
  optional(SPC) %R% capture(or("M", "F"))

# Check pattern
str_view(text, pattern2)

# Pull out pieces
str_match(text, pattern2)















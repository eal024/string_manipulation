

library(rebus);library(tidyverse);


# This reads *Match a hash, followed by six hexadecimal values.*

p <-  "#" %R% hex_digit(6)


str_view_all( c("Eirik liker #99af01, Martha liker #654321, og  #99af01"), pattern = p)


# To match only a hex colour and nothing else, you can add anchors to the 
# start and end of the expression.

p_a <- START %R% "#" %R% hex_digit(6) %R% END

str_view( c("Eirik liker #99af01, Martha liker #654321, og  #99af01"), pattern = p_a)


x <- c("catfish", "tomcat")

rx_start <- START %R% "cat"

rx_end <- "cat" %R% END

str_view(x, pattern = rx_start)

str_view(x, pattern = rx_end)


# From data-camp:
# The basic in rebus:

START 
END
exactly()
ANY_CHAR

%R% # then

## char_class: 

char_class("Aa")    # Dette tegnet
negated_char_class("Aa") # Alle utenom disse:

str_view_all(string = "Hei du er ei fina. Are er kul", pattern = char_class("Aa") )


string <- "Hei du er ei fina. Are er kul"

str_view_all(string = "Aaa hei AAaa", pattern = negated_char_class("Aa"))

# Repetion:

optional()
zero_or_more()
one_or_more()

pattern <- repeated(pattern, 1,2) 

str_view(string = "123 123", pattern = pattern)


# short-cuts:

## shortcut
DGT
char_class("0-9")

WRD
char_class("a-zA-Z0-9_")

SPC
#a white space
char_class("0-9")


#Example.

str_view_all("123", pattern = DGT) # Alt:
str_view_all("123", pattern = char_class("0-9"))

# Many more alternativs: look up ?DGT

# Example 2:

x <- c("a1 A", " a1 a")

rx <- LOWER %R% DIGIT %R% SPACE %R% UPPER

str_view_all(x, pattern = rx)



# More example: pracsis- --------------------------------------------------


# String:
x <- c("cat", "coat", "scotland", "tic toc", "bil")

# Start
str_view(x, pattern = START %R% "c")
str_view(x, pattern = START %R% "co")
# End
str_view(x, pattern = "t" %R% END)

# Excactly
str_view(x, pattern = START %R% "cat" %R% END )


## Extra:

#
ANY_CHAR

str_view(x, pattern = ANY_CHAR)
# Lik metode:
str_view(x, pattern = or(A,B))
#

str_view(x, pattern = "t" %R% ANY_CHAR )
str_view_all(x, pattern = "t" %R% ANY_CHAR )

# Match two letters
str_view(x, pattern = "t" %R% ANY_CHAR %R% ANY_CHAR)


# Example match string exactl. three char:

str_view_all( x, pattern = START %R% ANY_CHAR %R% ANY_CHAR %R% ANY_CHAR %R% END)


# Example match q followed by any character 

str_view(x, pattern = "i" %R% ANY_CHAR)


# More examples: ----------------------------------------------------------

names_q <- c("Quentin", "Kaliq", "Jacques",  "Jacqes")

pattern <- "a" %R% ANY_CHAR


str_view(names_q, pattern = pattern)

str_subset(names_q, pattern = pattern)

# Hvor mange?
length( str_subset(names_q, pattern = pattern) )


# Extract 

st_ext_q <- str_extract(names_q, pattern = pattern)




table(st_ext_q)


# 
boy_names <- babynames::babynames %>% filter(sex == "M") %>% sample_n(size = 10000)

# Find part of name that matches pattern
str_extract(boy_names %>% pull(name), pattern =  pattern)

# Did any names have the pattern more than once?
table(str_extract(boy_names %>% pull(name), pattern =  pattern))




# Flere eksempler ---------------------------------------------------------

head(boy_names)


boy_name_string <- boy_names %>% pull(name) 

str(boy_name_string)

pattern_names <- or("Jeffrey", "Geoffrey")

# Match names:
str_view_all(boy_name_string, pattern = pattern_names, match =  T)

# Match ending.

str_view_all(boy_name_string, pattern = or("Je", "Geo") %R% "ffrey", match = T)

# Matchs alternativ ending
str_view(boy_name_string, pattern = or("Je", "Geo") %R% "ff" %R% or("ry", "ery", "rey", "erey"), match = T)



# More names --------------------------------------------------------------

girl_names <- babynames::babynames %>% filter(sex == "F") %>%  sample_n( size = 10000) %>% pull(name)

# Names that starts whit cath og kath
c_or_k_ath <- START %R% or("Cath", "Kath")

str_view( girl_names, pattern = c_or_k_ath, match = T)




































# email-lookup:

pattern_email <- one_or_more(char_class(ASCII_ALNUM %R% "._%+-")) %R%
  "@" %R%
  one_or_more(char_class(ASCII_ALNUM %R% ".-")) %R%
  DOT %R%
  ascii_alpha(2, 4)



lines <- "Dette er     en linje med    mange mellomrom.   "

words <- str_split(lines, " ");


lapply( lapply(words, str_length) , mean)


map( map(words, function(x) {str_length(x)} ), mean )









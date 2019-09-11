

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
x <- c("cat", "coat", "scotland", "tic toc")

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









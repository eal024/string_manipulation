library(tidyverse);library(tidytext)

moby <-
  "Call me Ishmael. Some years ago —nevermind how long precisely— having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people’s hats off - then, I account it high time to get to sea as soon as I can. This is my substitute for pistol and ball. With a philosophical flourish Cato throws himself upon his sword; I quietly take to the ship. There is nothing surprising in this. If they but knew it, almost all men in their degree, some time or other, cherish very nearly the same feelings towards the ocean with me."
  

# clean text

"en linje 100 med punktum. Fulgt av flere ord og 10" %>% 
  str_to_lower(.) %>% 
  str_replace_all(pattern =  "[[:punct:]]", replacement = "") %>%
  str_replace_all(pattern =  "[[:digit:]]", replacement = "X") %>% 
  str_replace_all(pattern =  "\\s+", replacement = "") 


#
moby_clean <-
  moby %>% 
  str_to_lower(.) %>% 
  str_replace_all(pattern =  "[[:punct:]]", replacement = "") %>%
  str_replace_all(pattern =  "[[:digit:]]", replacement = "") %>% 
  str_replace_all(pattern =  "\\s+", replacement = " ") %>% 
  str_trim(.)

moby_clean_1 <-
  moby_clean  %>% 
  unlist( str_split(moby_clean, " "))

# Count words
length( unlist(str_split(moby_clean, " ")))


word_counter <- function( streng ) {
  
  for(i in length(streng))
}



for(i in 1:length(str_split(moby, " "))) {
  print(i)
}










    

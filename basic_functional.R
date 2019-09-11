



# oppbygning --------------------------------------------------------------



f1 <- function(x,i) { abs(x- mean(x))^i }


a <- c(1:5)
b <- c(6:10)
c <- c(10:14)

f1(a, 2)

library(tidyverse)

df <- tibble(a =a , b = b, c = c)


f1 <- function(x) { sum(x)}

col_sum <- function(df, fun) {
  out <- vector("double", length(df));
  
  for( i in seq_along(df)) {
    
    out[i] <- fun(df[[i]])
  }

  out  
  
}


col_sum(df, median)


# split -------------------------------------------------------------------

mtcars %>% 
  split(.$cyl) %>% 
  map(function(x) { lm(mpg ~ wt, data = x) })









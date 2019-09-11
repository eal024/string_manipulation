


library(tidyverse)

df <- tibble( a = c("eirik","eirik","trond" , "trond"),
              avd = c("ffi", "sf", "vd", "telenor" ) 
              )

df_spread <-
  df %>% 
  mutate(verdi = avd) %>% 
  spread(avd, verdi, fill = "")


df_spread %>% unite(ny_avd, col = c("ffi", "sf", "telenor", "vd"), sep = "-")



df_spread %>% mutate( ny_avd = str_c(ffi,sf,telenor,vd, sep = " ")) %>%
  mutate(ny_avd = str_trim(ny_avd,"left")) %>% 
  mutate(ny_avd = str_replace(ny_avd, pattern = " ", "/"))


df_spread$ny <- do.call(str_c, df_spread[c("ffi", "sf", "telenor", "vd")])





df_spread %>% mutate( ny_avd = str_c(, sep = " ")) %>%
  mutate(ny_avd = str_trim(ny_avd,"left")) %>% 
  mutate(ny_avd = str_replace(ny_avd, pattern = " ", "/"))



# load libraries
library(dplyr)
library(stringr)
# create data.frame
df = data.frame(
  x = rep(0,5),
  y = 1,
  var = 2,
  another_var = 5,
  var.4 = 6
)
# function to construct reg exp from vector with variable names
varlist = function(x) {
  x = str_c('^(',paste(x, collapse='|'),')$')
  x = str_replace_all(x,'\\.','\\\\.')
  return(x)
}
# select variables based on vector of variable names
vars = c('y','another_var','var.4')
df %>%
  select(matches(varlist(vars)))


c1<-c("T1", "X1", "T6", "R5")
c2<-c("R4", "C6", "C7", "X3")
c3<-c("C5", "C2", "X4", "T2")

df<-data.frame(c1, c2, c3)





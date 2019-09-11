library(ggplot2)
library(ggthemes)
library(dplyr)
library(purrr)
library(pwt9)



data("pwt9.0")

pwt9::pwt9.0

country_list <- c("France", "Germany", "United States of America", "Luxembourg", "Switzerland", "Greece")

small_pwt <- pwt9.0 %>%
  filter(country %in% country_list)


small_pwt <- small_pwt %>%
  mutate(country = factor(country, levels = country_list, ordered = TRUE))


# avh: Average annual hours worked by persons engaged

ggplot(data = small_pwt) + theme_tufte() +
  geom_line(aes(y = avh, x = year)) +
  facet_wrap(~country)

# Alt
ggplot(data = small_pwt) + theme_tufte() +
  geom_line(aes(y = avh, x = year)) +
  facet_grid(country~.)


# Må bruke do ved bruk av dplyr og ggplot
plots <- small_pwt %>%
  group_by(country) %>%
  do(plot = ggplot(data = .) + theme_tufte() +
       geom_line(aes(y = avh, x = year)) +
       ggtitle(unique(.$country)) +
       ylab("Year") +
       xlab("Average annual hours worked by persons engaged"))

print(plots)

# Fra liste lit laget plot:
file_names <- stringr::str_c(country_list, ".pdf")

map2(file_names, plots$plot, ggsave )



map2(file_names, plots$plot, function(x, y) { ; ggsave(filename =  x, plot = y) })

walk2(file_names, plots$plot, function(x, y) { ; ggsave(filename =  x, plot = y) })



# split to list -----------------------------------------------------------







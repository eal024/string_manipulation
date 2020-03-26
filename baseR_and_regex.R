
# Regex in baseR. 
 
# -------------------------------------------------------------------------

animals <- c("cat", "moose", "impala", "ant")

#
#grepl(pattern = <regex>, x = <string>)
grepl( pattern = "a", x = animals)
which(grepl( pattern = "a", x = animals))
grep(pattern = "a", x = animals)
# start with a or end with a
grepl( pattern = "^a", x = animals)
grepl( pattern = "a$", x = animals)

# bytter
# The first
sub(pattern = "a", replacement = "A" , x = animals)

# replace all matches
gsub(pattern = "a", replacement = "A" , x = animals)

# | 
gsub(pattern = "a|i", replacement = "A" , x = animals)


# Example -----------------------------------------------------------------

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", x = emails)
# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu$", x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)
hits2 <-grep(pattern = "@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]
emails[hits2]


# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu$", x = emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <-grep(pattern = "@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]

# Use sub() to convert the email domains to datacamp.edu
sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails )





# Time and date -----------------------------------------------------------

today <- Sys.Date()
today
class(today)

date <- as.Date("1971-14-05", format = "%Y-%d-%m")
date


# A Date object -
now <- Sys.time()
now
class(now)

# Posix-standard
as.POSIXct("1971-05-14 11:25:15")

date + 1
date2 <- as.Date("1990-01-01")
date2 - date

# R start time counting in 1970-01-01 time 00

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")



# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")






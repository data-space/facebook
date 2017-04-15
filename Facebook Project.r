




install.packages("devtools",repos = "http://cran.us.r-project.org")
library(devtools)
install.packages("Rfacebook",repos = "http://cran.us.r-project.org")
require (Rfacebook)









token <- 'EAACEdEose0cBAEQYAQ9xketBXPlvSjQqOrR1QhL8gJTSljXDRY7O2XFTlJ2wzsg3Y1rZCJUlkGMG28Q4I4ZBje4UFIMDjTOvCV8uLUAF0wds2WyGUhKenEoYjbYqDl8P9MHmTKO4s3hZAE5EtcKLqEn5SlrnCqov0IcGTg5uXzvHcMK6OxSAWgVJgfOTkgZD'
me <- getUsers("me", token, private_info=TRUE)
me$name
me$username
me$gender
me$birthday
me$location




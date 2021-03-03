# cache credentials
# 
# after setting up token for git access
# https://happygitwithr.com/credential-caching.html#credential-caching
# install.packages("gitcreds")
library(gitcreds)
gitcreds_set()
gitcreds_get()

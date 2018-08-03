###################################
#
# util functions
#
###################################

hedo <- function(x, len=10){
  #created function to see head in both directions
  print(x[1:len,1:len])
}

require(RColorBrewer)
# display.brewer.all()
# rand.data <- replicate(8,rnorm(100,100,sd=1.5))
# boxplot(rand.data,col=brewer.pal(8,"Set3"))

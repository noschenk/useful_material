# return the value/s of maxima. Can be used to filter out maximum values from cumulative data per day.
# input : 
#   values_vector : the vector of values (in correct order) which is filtered for maxima.
#     must contain zeroes as minimum (don't delete them out)
#   noresult : the value which is returned if there is no maximum. Defaults to 0 (for cumulative measures)
# output : 
#   collapsed_vector : the values of the maximum / maxima
#     In order to get total amount, sum them.

return_max_values <- function(values_vector, noresult = 0){
  collapsed_vec <- rle(values_vector)$values
  locations_vec <- which(diff(sign(diff(collapsed_vec))) == -2) + 1
  res <- collapsed_vec[locations_vec]
  if(length(res) == 0){
    return(0)
    } else {
   return(res) 
  }
}

# EXAMPLES
# return_max_values(c(0,1,1,0,2,2,3,4,5,6,9,0,2,3,0,3,0))
# return_max_values(c(1, 0,0))
# return_max_values(c(1, 1, 1))
# return_max_values(c(0, 0, 0))
# return_max_values(c(12, 19, 300))

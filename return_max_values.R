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
  locations_vec <- which(diff(c(sign(diff(collapsed_vec)), -1)) == -2) + 1
  # check which is -2 because this means a change from going up to going down --> c(1, -1) has diff = -2
  #    note : If i would like to get maxima, I would search where diff is 2, because diff(c(-1, 1)) is 2
  # take -1 because only diff of c(sign(diff(...)), -1) returns -2 for situations in which the function
  #   does not go down any more. (monotonical increase would not give a result)
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

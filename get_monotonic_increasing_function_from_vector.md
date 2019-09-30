# Function to convert any function to monotonically increasing function
In case you have a vector of values which should be monotonically increasing, but aren't. In my case, values are recorded by a machine and added to each other within a predefined time interval. E.g. The amount of water consumed within 24 hours. The counting starts again after 24 hours. There are two types of minima : the true minima, resulting from the "set-to-zero" by the machine, and some wrong recordings by the machine.

For an example, check the line for 0 rounds : This is the raw vector of values with a global minimum at 0 and a local minimum somwhere above, which needs to be removed.

<img src="https://user-images.githubusercontent.com/32162523/65876954-d2044d00-e38a-11e9-8f94-282ce8dff288.png" width="500px">

```
# Take out minima from a vector which are not zero. Those usually correspond to 
#    machine errors.
#    values are recorded either within 24h or per infusion (or similar), and within
#    these recording rounds, the values must be monotonic increasing
# input : 
#    collapsed_vec: a collapsed vector (no repetitions of numbers)
get_monotonic_increasing <- function(collapsed_vec){
  # all values which are not 0 must be monotoneously increasing
  if(any(collapsed_vec[which(sign(diff(collapsed_vec)) == -1)] != 0)){
    # print("one of the minima is not 0 and needs to be removed")
    # get candidate locations
    candidate_loc <- which(sign(diff(collapsed_vec)) == -1)
    # remove those entries from candidate loc, which are 0 (normal minima)
    candidate_loc <- candidate_loc[which(collapsed_vec[candidate_loc] != 0)]
    collapsed_vec <- collapsed_vec[-candidate_loc]
  }
  return(collapsed_vec)
}
```
The plot has been generated with the following code : 
```
test <- c(0,  180,  430,  610,  180,  430,  610,  860, 1004, 1184)

plot(test, col = dark2[1], lty = 2, type = "l", lwd = 2, main = "convert function to monotonically increasing", sub = "use of function 'get_monotonic_increasing'. Conversion after 2 rounds.", xaxt = "n", xlab = "", ylab = "", yaxt = "n")
lines(get_monotonic_increasing(test), col = dark2[2], lty = 2, lwd = 2)
lines(get_monotonic_increasing(get_monotonic_increasing(test)), col = dark2[3], lty = 2, lwd = 2)
lines(get_monotonic_increasing(get_monotonic_increasing(get_monotonic_increasing(test))), col = dark2[4], lty = 3, lwd = 2)
legend(7, 400, c("0 rounds", "1 round", "2 rounds", "3 rounds"), lwd=2, col = dark2[1:4], lty = c(2, 2, 2, 3))
```

Picture added thanks to [vinkla's post](https://gist.github.com/vinkla/dca76249ba6b73c5dd66a4e986df4c8d).

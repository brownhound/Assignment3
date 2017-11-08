## Script to satisfy the requirements of Assignment 3.  Accepts a 2 char state 
## abbreviation, an outcome, and the ranking of the hospital in that state
## for that outcome.  Reads the given data file.  Can take best, worst, or int
## for the ranking choice.  If the ranking number exceeds the number of facilites
## in a state, the function should return NA.  Hosptials that do not have data
## should be excluded when deciding rankings.  Ties should be broken using the 
## name.  

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  
  ## Check that state and outcome are valid.
  
  ## Return hospital name in the state with the given rank
  
  ## 30-day death rate
}
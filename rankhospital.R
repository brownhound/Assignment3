## Script to satisfy the requirements of Assignment 3.  Accepts a 2 char state 
## abbreviation, an outcome, and the ranking of the hospital in that state
## for that outcome.  Reads the given data file.  Can take best, worst, or int
## for the ranking choice.  If the ranking number exceeds the number of facilites
## in a state, the function should return NA.  Hosptials that do not have data
## should be excluded when deciding rankings.  Ties should be broken using the 
## name.  

rankhospital <- function(stateAbv, outcome, num = "best") {
  ## Read outcome data
  
  data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that the state and outcome are valid
  ## outcomes considered are attack, failure, and pneumonia
  
  if(!any(stateAbv == data$State)){
    stop(StateAbv, " is not a valid state")
  }
  else if(!any(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    stop(outcome, " is not a valid outcome")
  }
  
  ## Get data set for state only
  
  dataState <- NULL
  dataState <- data[data[, "State"] == stateAbv, ]
  
  ## Rank Hospitals by chosen outcome
  
   if(outcome == "heart attack"){
    orderedData <- dataState[order(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
  }
  
  else if(outcome == "heart failure"){
    orderedData <- dataState[order(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
  }
  
  else if(outcome == "pneumonia"){
    orderedData <- dataState[order(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
  }
  
  ## Define a row of interest
  
  if(num == "best") {
    rank <- 1
  }
  
  else if(num == "worst") {
    rank <- nrow(orderedData)
  }
  
  else {
    rank <- num
  }
  
  ## Return hospital name in the state with the given rank
  
  theFacility = orderedData$Hospital.Name[rank, ]
    
    
  ## 30-day death rate
  
  return(theFacility)
}
## Script to satisfy the requirements of Assignment 3.  Takes a state, an outcome
## and find the hospital in that state with the lowest death rate from the care
## outcome data provided.


best <- function(stateAbv, outcome) {
  
  ## Read Outcome Data
  
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
  
  ##Return Hosptital Name with Highest Ranking in "outcome" column in the state
  
  if(outcome == "heart attack"){
    bestFacility <- dataState$Hospital.Name[which.min(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)]
  }
  
  else if(outcome == "heart failure"){
    bestFacility <- dataState$Hospital.Name[which.min(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)]
  }
  
  else if(outcome == "pneumonia"){
    bestFacility <- dataState$Hospital.Name[which.min(
      dataState$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)]
  }
  
  return(bestFacility)
}
best <- function(stateAbv, outcome) {
  
  ## Read Outcome Data
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that the state and outcome are valid
  ## outcomes considered are attack, failure, and pneumonia
  
  if(!any(stateAbv == data$State)){
    stop(StateAbv, " is not a valid state")
  }
  else if(!any(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    stop(outcome, " is not a valid outcome value")
  }
  
  ## Assign column identifier based on outcome identified
  ## HA = 11, HF = 17, P = 23
  
  columnId <- NULL
  
  if(outcome == "heart attack"){
    columnId <- 11
  }
  
  else if(outcome == "heart failure"){
    columnId <- 17
  }
  
  else if(outcome == "pneumonia"){
    columnId <- 23
  }
  
  ## Return hospital name in that state with lowest 30-day 
  ## death rate
  
  ## Get data set for state only
  
  dataState <- NULL
  dataState <- data[data[, "State"] == stateAbv, ]
  
  ##Return Hosptital Name with Highest Ranking in "outcome" column
  
  bestFacility <- dataState$Hospital.Name[which.min(dataState$
                                                      
  return(bestFacility)
}
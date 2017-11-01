best <- function(state, outcome) {
  
  ## Read Outcome Data
  
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that the state and outcome are valid
  ## outcomes considered are attack, failure, and pneumonia
  
  if(!any(state == outcome$State)){
    stop("Not a valid state")
  }
  else if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))){
    stop("Not a valid outcome class")
  }
  
  ## Return hospital name in that state with lowest 30-day 
  ## death rate
  
}
rm(list = ls())
#clear the global workspace

rankhospital <- function(state, outcome, num = "best"){
  csv_dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (!state %in% csv_dat$State){
    stop("invalid state")
    #if state is not listed then stop and print "invalid state"
  }
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop("invalid outcome")
    #if an expected outcome is not entered then print "invalid outcome"
  }
  id_num <- which(csv_dat$State==state)
  #save indices of all the rows which contain the given state
  
  tot_num <- length(id_num)
  if (num == "best"){
    num <- 1
    #if best rank is desired then rank = 1
  }
  else if (num == "worst"){
   #move on
  }
  else if (num > tot_num){
    stop(NA)
    #if the rank is greater than the total number of hospitals then print NA
  }
  st_hosp <- csv_dat$Hospital.Name[id_num]
  #save the list of hospitals in the state of interest
  if (outcome == "heart attack"){
    st_output <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[id_num]
  #vector which contains the number of heart attacks
    }
  if (outcome == "heart failure"){
    st_output <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[id_num]
  #vector which contains the number of heart failures
    }
  if (outcome == "pneumonia"){
    st_output <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[id_num]
  #vector which contains the number of pneumonia
    }
  st_output <- as.numeric(st_output)
  #convert the number of outcomes to numeric type
  
  x <- data.frame("Hospital"=st_hosp, "Incident"=st_output)
  #create a data frame with columns Hospital and Incident
  
  ranked_ind <- order(x$Incident,x$Hospital)
  #vector with indices of x ordered according to the number of outcomes and the hospital names
  
  sorted_tab <- x[ranked_ind,]
  #new array which contains appropriately orderrd hospital names and outcomes
  
  if (num =="worst"){
  filtered_sorted <- na.omit(sorted_tab)
  #remove the outcomes with NA if the query is for the worst hospital
  
  num <- length(filtered_sorted$Hospital)
  #total number of rows after the removal of NA
  
  filtered_sorted$Hospital[num]
  #desired output
  }
  else {
  sorted_tab$Hospital[num]
  #desired output
  }
  
}
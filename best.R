#clear the global workspace
rm(list = ls())

best <- function(state, outcome){
  #read data to the csv_dat data frame
  csv_dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #create a vector of the outcome
  if (outcome == "heart attack"){
    out_data <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  } 
  else if (outcome == "heart failure") {
    out_data <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  else if (outcome == "pneumonia"){
    out_data <- csv_dat$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  else {
  #if outcome is not one of "heart attack", "heart failure" or "pneumonia" then stop
   stop('invalid outcome')
  }
  
  out_data <- as.numeric(out_data)
  
  #subset data containing the state of interest
  if (state %in% csv_dat$State){
    #indices of the rows containg the state name
    id_num <- which(csv_dat$State==state)
    
    #output data in the state
    st_output <- out_data[id_num]
    
    #hospital names in the state
    st_hosp <- csv_dat$Hospital.Name[id_num]
    
    #indices of the outcome with minimum values for the given state
    min_out <- which(st_output==min(st_output, na.rm=TRUE))
    
    #names of the hospitals which correspond to minimum values of outcome
    hos_names <- st_hosp[min_out]
    
    #first name on the list of hospitals in ascending order
    sort(hos_names)[1]
   
  } else{
    #if state is not a valid name then stop
    stop('invalid state')
  }
  
}
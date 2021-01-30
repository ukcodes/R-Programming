rm(list = ls())
rankall <- function(outcome, num = "best"){
  csv_dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop("invalid outcome")
    #if an expected outcome is not entered then print "invalid outcome"
  }
  if (num=="best"){
    num <- 1
  } 
  
  s <- split(csv_dat,csv_dat$State)
  #split data frame according to the state
  
  lapply(s, function(x){
    hos_name <- x$Hospital.Name
    st_name <- x$State
    if (outcome=="heart attack"){
      st_output =as.numeric(x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    }
    else if (outcome == "heart failure"){
      st_output =as.numeric(x$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    }
    else if (outcome == "pneumonia"){
      st_output =as.numeric(x$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    }
    rframe <- data.frame("Hospital"=hos_name, "Incident"=st_output, "ST"=st_name)
    
    nframe <- na.omit(rframe)

    ranked_ind <- order(nframe$Incident,nframe$Hospital)
    #vector with indices of x ordered according to the number of outcomes and the hospital names

    sorted_tab <- nframe[ranked_ind,c("Hospital","ST")]
    
    
    if (num == "worst"){
      num <- length(sorted_tab$Hospital)
    }
   
    sorted_tab[num,]
  })

}
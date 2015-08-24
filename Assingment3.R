best <- function(state,outcome){
  t1 <- data.frame()
  care <-  read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if(!(state %in% care$State)){
    print("invalid state")
  }else{
    t1 <- care[care$State==state,]
  } 
  if (outcome == "heart attack"){
    care[,11] <- as.numeric(care[,11])
    return(t1[order(t1[,11]),2][1])
  }else if (outcome == "heart failure"){
    care[,17] <- as.numeric(care[,17])
    return(t1[order(t1[,17]),2][1])
  }else if (outcome == "pneumonia"){
    care[,23] <- as.numeric(care[,23])
    return(t1[order(t1[,23]),2][1])
  }else{
    print("invalid outcome")
  }
}

rankhospital <- function(state,outcome,r){
  t1 <- data.frame()
  care <-  read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if(!(state %in% care$State)){
    print("invalid state")
  }else{
    t1 <- care[care$State==state,]
  } 
  if (outcome == "heart attack"){
    care[,11] <- as.numeric(care[,11])
    return(t1[order(t1[,11]),2][xr])
  }else if (outcome == "heart failure"){
    care[,17] <- as.numeric(care[,17])
    return(t1[order(t1[,17]),2][r])
  }else if (outcome == "pneumonia"){
    care[,23] <- as.numeric(care[,23])
    return(t1[order(t1[,23]),2][r])
  }else{
    print("invalid outcome")
  }
}
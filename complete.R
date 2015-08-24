loadcvs <- function(directory){
  t1 <<- data.frame()
  counter <- 0
  for (i in list.files(directory,pattern="*.csv", full.names = T))
  {
    if (counter == 0){
      t1 <<- read.csv(i)
    }else{
      t2 <- read.csv(i)
      length(t2)
      t1 <<- merge(t1,t2, by = c("Date", "sulfate", "nitrate", "ID"), all=T)
    }
    counter <- counter +1
  }
  t1
}

complete <- function (directory, id= 1:332){
  if (!exists("t1")){
    #parent.t3 <- data.frame()
    t1 <<- loadcvs(directory)
  }
  t2 <- t1[complete.cases(t1),]
  res <- data.frame()
  for (i in id){
    res <- rbind(res,c(i, nrow(t2[t2$ID == i,])))
  }
  names(res) <- c("id","nobs")
  res
}
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

pollutantmean <- function(directory, pollutant, id = 1:332){
  if (!exists("t1")){
    t1 <<- loadcvs(directory)
  }
  all <- t1[t1$ID %in% id,][[pollutant]]
  bad <- is.na(all)
  mean(all[!bad])
} 
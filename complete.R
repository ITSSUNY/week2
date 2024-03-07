complete <- function(directory,  id = 1:332){
  ##source("complete.R")
  ##complete("specdata", 1)

  setwd(directory)
  
  normalCount <- 0

  idCount = length(id)
  print("id cont")
  print(idCount)
  
  
  idData <- c()
  nobsData <- c()
  
  for(ii in id){
    if(ii<10 ){
      prefix <- paste("00", ii, sep="")
      
    }else if(ii>= 10 && ii<99){
      prefix <- paste("0", ii, sep="")
      
    }else {
      prefix <- paste(ii, sep="")
      
    }
    fileName <- paste(prefix, ".", "csv", sep="") 
    
    ## read file
    con <- file(fileName, "r")
    data <- read.csv(con)
    close(con)
   
    ##print(data)
    
    y <- data[!is.na(data[1]) & !is.na(data[2]) & !is.na(data[3]) &  !is.na(data[4])]
    
    ##naData <- is.na(data)
    ##print(naData)
    ##y <- data[!naData]
    
    ##y <- data[!is.na(data[])]
    ##print(y)
    
    
    normalCount <- length(y)
    ##print(normalCount/4)
    normalCount <-  normalCount /4
    
    print(paste("MonitorId[", ii, "]:", normalCount/4, sep=" "))
    
    idData <- c(idData,ii)
    nobsData <-  c(nobsData,normalCount)
    
    
  }
  print("idData")
  print(idData)
  print(nobsData)
  
  result <- data.frame(id=idData, nobs = nobsData)
  print(result)
  ##result <- data.frame(id=, bar=)
  
  result
  
  setwd("../")
}
  
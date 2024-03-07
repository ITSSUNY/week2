pollutantmean <- function(directory, pollutant, id = 1:332){

  
  ##source("pollutantmean.R")
  ##pollutantmean("specdata", "sulfate", 1:10)
  
  print(R.version.string)
  
  setwd(directory)
  
  totalSum <- 0
  count <- 0
  for(ii in id){


    if(ii<10 ){
      prefix <- paste("00", ii, sep="")

    }else if(ii>= 10 && ii<=99){
      prefix <- paste("0", ii, sep="")
      
    }else {
      prefix <- paste(ii, sep="")
      
    }
    fileName <- paste(prefix, ".", "csv", sep="") 
  
    ##print(fileName)
    
    ## read file
    con <- file(fileName, "r")
    data <- read.csv(con)
    close(con)
    
    targetData <- data[[pollutant]]
    ##print(targetData)
    
    y <- targetData[!is.na(targetData)]
    ##print("yyyyyyyyyyyyyyyyyyy")
    ##print(y)
    ##print(sum(y))
    totalSum <- totalSum + sum(y)
    count <- count + length(y)
    ##print(totalSum)
    ##print(count)
    
  }
  setwd("../")
  
  totalSum/count
  
  print(totalSum/count)

 

}
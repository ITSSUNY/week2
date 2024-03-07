corr <- function(directory,  threshold = 0){
  setwd("D:/data science_project/coursera/week2")
  print(R.version.string)
  
  ##source("corr.R")
  ##source("complete.R")
  ##cr <- corr("specdata", 150)
  ##head(cr)
  
  normalcase <- complete(directory, 1:332)
  ##print("after complete ===============")
  
  ##print(class(normalcase))
  ##print(unclass(normalcase))
  ##print("----------------------")


  ##print("----------------------dddd")
  ##upperNobs <-  normalcase[ normalcase["nobs"]>threshold]
  
  upperNobs <- subset(normalcase, nobs>threshold)

  print("upperNobs----------")
  print(upperNobs)
  print(class(upperNobs))
  print(unclass(upperNobs))
  
  rowcount <- nrow(upperNobs)
  print("rowcount-------")
  print(rowcount)
  
  xdata <- c()
  ydata <- c()
  cordata <- c()
  setwd(directory)
  
  ##print("upperNobs111----------")
  if(rowcount>0){
    for(ii in 1:rowcount){

      id = print(upperNobs[ii, "id"])
      print("id-------")
      print(id)      
      if(id<10 ){
        prefix <- paste("00", id, sep="")
        
      }else if(id>= 10 && id<=99){
        prefix <- paste("0", id, sep="")
        
      }else {
        prefix <- paste(id, sep="")
        
      }
      fileName <- paste(prefix, ".", "csv", sep="") 
      
      ##print(fileName)
      
      con <- file(fileName, "r")
      data <- read.csv(con)
      close(con)
      
      
      
      print("----------------data")
      print(data)
      
      notNaData <- subset(data, !is.na(sulfate) & !is.na(nitrate  ) & !is.na(ID  ))
      
      ##notNaData <- data[!is.na(data[1]) & !is.na(data[2]) & !is.na(data[3]) &  !is.na(data[4])]
      
      ##print(notNaData)
      
      xdata<- c(  notNaData[,"sulfate"])
      ydata<- c(  notNaData[,"nitrate"])
      
      cordata <- c(cordata, cor(xdata,ydata))
      
  
      
    }
    print("cordataprint(cordata)print(cordata)")
    print(cordata)
  
  }
  setwd("D:/data science_project/coursera/week2")
  cordata

  ##print("cordata(cordata)print(cordata)")
  ##print(head(cordata))
  
  
  
  
  
}
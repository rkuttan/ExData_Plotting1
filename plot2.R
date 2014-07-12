plot2 <- function() {
  #read the data. Every line of data is read in that matches only the 1st and 2nd Feb 2007 as per the assignment.    
  energyData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';',dec=".")
  col <-read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)
  colnames(energyData) <- c(colnames(col))      
  dateTime <- strptime( paste(energyData$Date,energyData$Time), format="%d/%m/%Y %H:%M:%S")
  
  png(file="plot2.png")  
  with(energyData, plot(dateTime, Global_active_power, type="l",xlab="",ylab="Global Active Power (killowatts)"))  
  dev.off()
}

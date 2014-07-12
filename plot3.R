plot3 <- function() {
  #read the data. Every line of data is read in that matches only the 1st and 2nd Feb 2007 as per the assignment.   
  energyData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';',dec=".")
  col <-read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)
  colnames(energyData) <- c(colnames(col))    
  
  dateTime <- strptime( paste(energyData$Date,energyData$Time), format="%d/%m/%Y %H:%M:%S")  
  png(file="plot3.png")  
  plot (dateTime,energy$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  lines(dateTime,energy$Sub_metering_2,type="l",col="red")
  lines(dateTime,energy$Sub_metering_3,type="l",col="blue") 
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  dev.off()
}

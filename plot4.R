plot4 <- function() {
  #read the data. Every line of data is read in that matches only the 1st and 2nd Feb 2007 as per the assignment.   
  energyData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';',dec=".")
  col <-read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)
  colnames(energyData) <- c(colnames(col))    
  
  dateTime <- strptime( paste(energyData$Date,energyData$Time), format="%d/%m/%Y %H:%M:%S")  
  png(file="plot4.png")  
  #Split the plotting area in to 4 to accomodate the 4 plots.
  par(mfrow=c(2,2))
  
  #First plot
  plot(dateTime,energy$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  
  #Second plot
  plot(dateTime,energy$Voltage,type="l",ylab="Voltage")
  
  #Third plot
  plot (dateTime,energy$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  lines(dateTime,energy$Sub_metering_2,type="l",col="red")
  lines(dateTime,energy$Sub_metering_3,type="l",col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  #Fourth plot
  plot(dateTime,energy$Global_reactive_power,type="l",ylab="Global Reactive Power")
  
  dev.off()
}

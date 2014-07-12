plot1 <- function() {
  #read the data. Every line of data is read in that matches only the 1st and 2nd Feb 2007 as per the assignment.   
  energyData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
  col <-read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1)
  colnames(energyData) <- c(colnames(col))    
  
  png(file="plot1.png")
  with(energyData, hist(energyData$Global_active_power, main="Global Active Power",xlab="Global Active Power(killowatts)",col="red"))  
  #title(main="Global Active Power") 
  dev.off()
}

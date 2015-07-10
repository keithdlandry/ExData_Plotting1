plot3 <- function(file = "household_power_consumption.txt"){
  
  #use read.csv2.sql to read in only selected dates in the format dd/mm/yyyy
  #note: library sqldf is required
              # install.packages(sqldf)
              # library(sqldf)
  hpc <- read.csv2.sql(file, sql = "Select * From file WHERE date = '1/2/2007' OR date = '2/2/2007' ", sep = ";")
  
  png(filename = "plot3.png", width = 480, height = 480)
  
  plot( strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"), hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"), hpc$Sub_metering_1, type = "l")  
  lines(strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"), hpc$Sub_metering_2, type = "l", col = "red") 
  lines(strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S"), hpc$Sub_metering_3, type = "l", col = "blue") 
  
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","blue","red"), lwd = 1, lty = c(1,1,1))

  dev.off()
}
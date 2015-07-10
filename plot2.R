plot2 <- function(file = "household_power_consumption.txt"){
  
  #use read.csv2.sql to read in only selected dates in the format dd/mm/yyyy
  #note: library sqldf is required
              # install.packages(sqldf)
              # library(sqldf)
  hpc <- read.csv2.sql(file, sql = "Select * From file WHERE date = '1/2/2007' OR date = '2/2/2007' ", sep = ";")
  
  png(filename = "plot2.png", width = 480, height = 480)
  
  #paste together the date and time columns, then use strptime to get it in class "POSIXlt" "POSIXt"
  plot( strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S"),hpc$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S"),hpc$Global_active_power, type = "l")
  
  dev.off()
}
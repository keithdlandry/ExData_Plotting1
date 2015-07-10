plot1 <- function(file = "household_power_consumption.txt"){
  
  #use read.csv2.sql to read in only selected dates in the format dd/mm/yyyy
  #note: library sqldf is required
              # install.packages(sqldf)
              # library(sqldf)
  hpc <- read.csv2.sql(file, sql = "Select * From file WHERE date = '1/2/2007' OR date = '2/2/2007' ", sep = ";")
   
  png(filename = "plot1.png", width = 480, height = 480)
  
  hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  dev.off()
}
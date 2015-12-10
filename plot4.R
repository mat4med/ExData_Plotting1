
### started: Dec 7, 2015
### Project 1, plot3.R 

## to run this function:
## source("plot4.R")
## plot4()

plot4  <- function() {

	## remove the path and keep the file name:
	path <- "D:/Docs/MoveTo/Exploratory Data Analysis/Project 1/household_power_consumption.txt"

	## data should be in local path  

	## [1] load libraries
	library(sqldf)
	library (lubridate)
	
	## [2] use sqldf library to read data for specified dates
	## note: it appears that sqldf does not support missing values ?!
	hpc <- read.csv.sql(path, 
		sql = "select * from file where Date in ('1/2/2007', '2/2/2007') ", 
		header = T, sep = ";")
	
	## [3] close connection
	closeAllConnections()
	
	## [4] replace "?" with NA, then remove na from data set
	hpc[hpc=="?"] <- NA
	hpc <- na.omit(hpc)
	
	## [5] plot
	## create 2 by 2 panel plot	
	par(mfrow=c(2,2))
	## first plot
	plot(dmy_hms(paste(p$Date, p$Time)), p$Global_active_power, type = "l",
		xlab = "", ylab = "Global Active Power (kilowatts)")
	## second plot
	plot(dmy_hms(paste(p$Date, p$Time)), p$Voltage, type = "l", 
		col = "black", xlab = "datetime", ylab = "Voltage")
	## third plot
	plot(dmy_hms(paste(p$Date, p$Time)), p$Sub_metering_1, type = "l", 
		col = "black", xlab = "", ylab = "Energy Sub Metering",
		ylim = c(0, max(p$	Sub_metering_1, p$Sub_metering_2, p$Sub_metering_3)))
	lines(dmy_hms(paste(p$Date, p$Time)), p$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "")
	lines(dmy_hms(paste(p$Date, p$Time)), p$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "")
	
	legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), 
       lwd = 2, lty = 1, pch = ".", bty = "n", cex = 0.7)
	## forth plot
	plot(dmy_hms(paste(p$Date, p$Time)), p$Global_reactive_power, type = "l", 
		col = "black", xlab = "datetime", ylab = "Global_reactive_power")	
	## rest plot panel
	par(mfrow=c(1,1))
}


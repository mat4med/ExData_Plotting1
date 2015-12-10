
### started: Dec 7, 2015
### Project 1, plot2.R 

## to run this function:
## source("plot2.R")
## plot2()

plot2  <- function() {

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

	## [5] plot global active power (kilowatts)
	plot(dmy_hms(paste(p$Date, p$Time)), p$Global_active_power, type = "l",
		xlab = "", ylab = "Global Active Power (kilowatts)")
}


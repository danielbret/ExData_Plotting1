## Script:  plot4.R
## Project: Exploratory Data Analysis Project 1
## Date:    06-23-2016

## Housekeeping
#  Clean up RStudio
rm(list=ls())
#  Set working directory where the downloaded file has been unzipped
setwd("C:/JHU_R/data")
#  Confirm working directory
getwd()

#  Import data into R
#  Read only the rows corresponding to the two days of interest: 2007-02-01 and 2007-02-02
#  Note that the date values in the file are formatted as dd/mm/yyy
hpc <- file('household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc), value=TRUE), sep=';', col.names=c("Date","Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.string='?')

# Convert the Date and Time variables to a single Date/Time value suitable for graphing on the x=axis
data$Date <- as.Date(data$Date, format='%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Create Plot 4
# Open graphics device
png(file = 'plot4.png', width=480, height=480, units='px')

# Plot graph
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, xlab=' ', ylab='Global Active Power', type='l')
plot(data$DateTime, data$Voltage, xlab='datetime', ylab='Voltage', type='l')
plot(data$DateTime, data$Sub_metering_1, xlab=' ', ylab='Enery sub metering', type='l')
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd=1, bty='n')
plot(data$DateTime, data$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

# Close graphics devise
dev.off()

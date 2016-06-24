## Script:  plot1.R
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

# Create Plot 1
# Open graphics device
png(file = 'plot1.png', width=480, height=480, units='px')

# Plot histogram
with(data, hist(Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red'))

# Close graphics devise
dev.off()

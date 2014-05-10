################################################################################
## Summary          : R Script to create a basic plots
## Source of Data   : UC Irvine Machine Learning Repository,
## Data set         : Electric power consumption [20Mb]
## Description      : Create a plot for Global Active Power 
##                    between the dates of Feb 1 and Feb 2 of 2007
## Assumptions      : Creating files in current working directory is allowed
################################################################################

## Step 1: Read the data from given source into memory
data <- read.table("household_power_consumption.txt", 
                   sep=";",
                   header=TRUE, 
                   na.strings="?")

## Step 2: Extract rows of interest to us
subgr <- c("1/2/2007", "2/2/2007")
subData <- subset(data, Date %in% subgr)

## Step 3: Convert Date, Time to DateTime objects
subData$DateTime <- strptime(paste(subData$Date, subData$Time), 
                             format="%d/%m/%Y %H:%M:%S")

## Step 4: Create a plot for Global Active Power
par(bg=NA)
par(mfrow=c(1,1))
plot(subData$DateTime, 
     subData$Global_active_power,
     type="l",      
     xlab="", 
     ylab="Global Active Power (kilowatts)",
     cex.lab=0.9,
     cex.main=0.9,
     cex.sub = 0.9,
     cex.axis=0.9)

## Step 5: Copy the displayed plot to a png in the current working directory
dev.copy(png,"plot2.png")
dev.off()
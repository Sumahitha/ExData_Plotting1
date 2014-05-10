################################################################################
## Summary          : R Script to create a basic plots
## Source of Data   : UC Irvine Machine Learning Repository,
## Data set         : Electric power consumption [20Mb]
## Description      : Create 4 basic plots
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

## Step 4: Create 4 plots

## Create a png device
png(file="Plot4.png",width=480,height=480)

## Set suitable margins
par(bg=NA)
par(mfrow = c(2,2))
par(mar = c(5,4,4,1))

## Add all 4 plots
plot(subData$DateTime, 
       subData$Global_active_power,
       type="l",      
       xlab="", 
       ylab="Global Active Power")

plot(subData$DateTime,
     subData$Voltage,
     type="l",      
     xlab="datetime", 
     ylab="Voltage")

plot(subData$DateTime, 
     subData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2,type="l",col="red")
points(subData$DateTime, subData$Sub_metering_3,type="l",col="blue")
legend("topright",
       lty=c(1,1,1), bty="n",
       col=c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subData$DateTime, 
     subData$Global_reactive_power,
     type="l",      
     xlab="datetime", 
     ylab="Global_reactive_power")

## Close the device
dev.off()
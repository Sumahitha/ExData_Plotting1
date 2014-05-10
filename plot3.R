################################################################################
## Summary          : R Script to create a basic plots
## Source of Data   : UC Irvine Machine Learning Repository,
## Data set         : Electric power consumption [20Mb]
## Description      : Create a plot for Energy sub metering r 
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


## Step 4: Create a plot for Energy sub metering

## Create a png device
png(file="Plot3.png",width=480,height=480)

par(bg=NA)
par(mfrow=c(1,1))

## plot to the png device directly
plot(subData$DateTime, 
     subData$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
points(subData$DateTime, subData$Sub_metering_2,type="l",col="red")
points(subData$DateTime, subData$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1), 
       col=c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Turn off png device
dev.off()
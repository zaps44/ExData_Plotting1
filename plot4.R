## plot4
## Ensure the data file called "household_power_consumption.txt" is located in your working directory


## create filename
dataFile <- paste(getwd(),"/household_power_consumption.txt",sep="")

## read in data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Add Datetime column
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## str(subSetData)
plotGlobalActivePower <- as.numeric(subSetData$Global_active_power)
plotGlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
plotVoltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## Create plot 4
png("plot4.png", width=480, height=480)

## 2x2 matrix
par(mfrow=c(2,2))

## first plot
plot(datetime, plotGlobalActivePower, type="l", xlab="", ylab="Global Active Power")

## second plot
plot(datetime, plotVoltage, type="l", xlab="datetime", ylab="Voltage")

## third plot
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty='n')

##fourth plot
plot(datetime, plotGlobalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() 

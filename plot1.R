## plot1
## Ensure the data file called "household_power_consumption.txt" is located in your working directory

## create filename
dataFile <- paste(getwd(),"/household_power_consumption.txt",sep="")

## read in data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data[,1] %in% c("1/2/2007", "2/2/2007"),]

## str(subSetData)
plotData <- as.numeric(subSetData$Global_active_power)

## Create plot 1
png("plot1.png", width=480, height=480)
hist(plotData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
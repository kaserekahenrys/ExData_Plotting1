#load data
datasets <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(datasets)
#Subset the data from the dates 2007-02-01 and 2007-02-02
subsetofdata <- datasets[datasets$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subsetofdata$Global_active_power)
globalReactivePower <- as.numeric(subsetofdata$Global_reactive_power)
voltage <- as.numeric(subsetofdata$Voltage)

subMetering1 <- as.numeric(subsetofdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetofdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetofdata$Sub_metering_3)

#plot2
datetime <- strptime(paste(subsetofdata$Date, subsetofdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
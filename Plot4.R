#First download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile ="Electric Power consumption", method= "curl")
unzip("Electric Power consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset the data for the dates we are interested in:
data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'),]

# Set the time and date in the correct format:
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Translate the variables so they easier to use
Gap <- data$Global_active_power
Gap <- as.numeric(Gap)
Volt <- as.numeric(data$Voltage)
Grp <- as.numeric(data$Global_reactive_power)

#Create the plot dimensions and the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, Gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, Volt, type="l", xlab="datetime", ylab="Voltage")
#Again the colours are not the same as in the given plot, as I am colourblind
plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="red", ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_2, type="l", col="blue",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_3, type="l", col="yellow",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("red","blue","yellow"))
plot(datetime, Grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
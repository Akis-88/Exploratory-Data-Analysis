#First download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile ="Electric Power consumption", method= "curl")
unzip("Electric Power consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset the data for the dates we are interested in:
data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'),]

# Set the time and date in the correct format:
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the plot dimensions and the plot
png("plot3.png",width=480,height=480)
#Here I want to apologise as I am colourblind, and I cannot see clearly the colours of the graphs in the instructions. 
#I used random colours instead

plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="red", ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_2, type="l", col="blue",ylim=c(0,40))
par(new=TRUE)
plot(datetime, data$Sub_metering_3, type="l", col="yellow",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("red","blue","yellow"))
dev.off()
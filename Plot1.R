#First download the data

 fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile ="Electric Power consumption", method= "curl")
unzip("Electric Power consumption")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Subset the data for the dates we are interested in:
data <- data[which(data$Date == '2/2/2007' | data$Date=='1/2/2007'),]

# Translate Gap so it's easier to use
Gap <- data$Global_active_power
Gap <- as.numeric(Gap)

#Create the plot dimensions and the plot
png("plot1.png",width=480,height=480)
hist(Gap,main="Global Active Power",xlab="Global Active Power (kilowatt)", ylab="Frequency",col="red")
dev.off()
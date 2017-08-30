##Submetering 1-2-3 view

#Load data into R for specified date range
range <- as.Date(c("2007-02-01","2007-02-02"))

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na="?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date %in% range)

#Create the plot
png("plot3.png", width=480, height=480)

#Populate with desired data
plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

#Add a legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

#Write the file
dev.off()

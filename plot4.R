##All views together

#Load data into R for specified date range
range <- as.Date(c("2007-02-01","2007-02-02"))

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na="?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date %in% range)

#Create the plot and framework
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Populate with desired data for #1 (new view)
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#Populate with desired data for #2
plot(data$Time, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

#Populate with desired data for #3
plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
#Add a legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

#Populate with desired data for #4 (new view)
plot(data$Time, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

#Write the file
dev.off()

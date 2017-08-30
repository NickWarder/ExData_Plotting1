##Global Active Power - Thursday through Saturday View

#Load data into R for specified date range
range <- as.Date(c("2007-02-01","2007-02-02"))

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na="?")
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date %in% range)

#Create the plot
png("plot2.png", width=480, height=480)

#Populate with desired data
plot(data$Time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#Write the file
dev.off()

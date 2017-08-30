##Global Active Power Graph

#Load data into R for specified date range
range <- as.Date(c("2007-02-01","2007-02-02"))

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date %in% range)
#Create the plot
png("plot1.png", width=480, height=480)

#Populate with desired data
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

#Write the file
dev.off()

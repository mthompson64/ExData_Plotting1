setwd("~/Desktop/Personal/Coursera/Exploratory Data Analysis")

# Read in data from 'household_power_consumption.txt'
data <- read.csv('household_power_consumption.txt',
                 stringsAsFactors=FALSE,
                 header=TRUE,
                 sep=';',
                 na.strings=c("","?","NA"))

# Convert Time and Date columns and subset dates 2007-02-01 and 2007-02-02
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# Plot and save graph of Global Active Power over time
# Initialize 2 by 2 plot
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Plot 1
with(data, plot(Time, Global_active_power, type="l",
                xlab="", ylab="Global Active Power"))
# Plot 2
with(data, plot(Time, Voltage, type="l",
                xlab="", ylab="Voltage"))
# Plot 3
with(data, plot(Time, Sub_metering_1, type="n",
                yaxp = c(0, 30, 3),
                xlab="", ylab="Energy sub metering",))
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Plot 4
with(data, plot(Time, Global_reactive_power, type="l",
                xlab="", ylab="Global Reactive Power"))
# Close graphics device
dev.off()
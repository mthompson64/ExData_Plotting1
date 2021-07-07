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

# Plot and save graph of Energy Sub Metering over time
png("plot3.png", width = 480, height = 480)
# Initialize a plot and add to it for each sub_metering level
with(data, plot(Time, Sub_metering_1, type="n",
                yaxp = c(0, 30, 3),
                ylab="Energy sub metering",
                xlab=""))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
# Add legend
legend("topright", lty="solid", col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close graphics device
dev.off()
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

# Plot and save histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
# Close graphics device
dev.off()
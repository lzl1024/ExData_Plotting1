rm(list=ls())
# get effective data, please refer to plot1.R, where raw data is handled and get subset from
data <- read.csv("data.csv", header = TRUE, sep = ",")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(strptime(data$DateTime, "%Y-%m-%d %T"))

Sys.setlocale(locale = "C")

# open device
png("plot4.png", height = 480, width = 480)

# prepare for subplot
par(mfrow = c(2, 2))


# plot 1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot 2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# draw legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# plot 4
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# turn off device
dev.off()
rm(list=ls())
# get effective data, please refer to plot1.R, where raw data is handled and get subset from
data <- read.csv("data.csv", header = TRUE, sep = ",")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(strptime(data$DateTime, "%Y-%m-%d %T"))

Sys.setlocale(locale = "C")

# open device
png("plot3.png", height = 480, width = 480)

plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# draw legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# turn off device
dev.off()
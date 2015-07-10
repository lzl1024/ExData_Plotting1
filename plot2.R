rm(list=ls())
# get effective data, please refer to plot1.R, where raw data is handled and get subset from
data <- read.csv("data.csv", header = TRUE, sep = ",")

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(strptime(data$DateTime, "%Y-%m-%d %T"))

Sys.setlocale(locale = "C")

# open device
png("plot2.png", height = 480, width = 480)

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# turn off device
dev.off()
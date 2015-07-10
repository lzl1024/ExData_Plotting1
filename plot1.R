# load file
file1 <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
file1$Date <- as.Date(file1$Date,format="%d/%m/%Y")

# get effective data
data <- subset(file1, file1$Date >= "2007-02-01" & file1$Date <= "2007-02-02")

# write effective data to csv file and clean memory
write.csv(data, "data.csv")
rm(list=ls())

# read data from effective data file
data <- read.csv("data.csv", header = TRUE, sep = ",")

# open a picture device
png("plot1.png", height = 480, width = 480)

# draw picture
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# close device
dev.off()
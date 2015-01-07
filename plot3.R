# Read Data
alldata <- read.csv("~/R/Data/household_power_consumption.txt", sep=";", na.strings="?")

# Create single column for time date in time format
alldata$datetimechar <- paste(alldata$Date , alldata$Time)
alldata$datetime <- strptime(alldata$datetimechar, "%d/%m/%Y %H:%M:%S")

# Subset desired dates
power <- subset(alldata , datetime > "2007-02-01" &  datetime < "2007-02-03" )

# Create graph
png(file = "plot3.png")
plot(power$datetime , power$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")

points(power$datetime , power$Sub_metering_2, type = "l", col ="red")
points(power$datetime , power$Sub_metering_3, type = "l", col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2" ,"Sub_metering_3") , lty = 1 , col = c("black", "red" , "blue"))
dev.off()

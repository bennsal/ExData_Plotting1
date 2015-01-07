# Read Data
alldata <- read.csv("~/R/Data/household_power_consumption.txt", sep=";", na.strings="?")

# Create single column for time date in time format
alldata$datetimechar <- paste(alldata$Date , alldata$Time)
alldata$datetime <- strptime(alldata$datetimechar, "%d/%m/%Y %H:%M:%S")

# Subset desired dates
power <- subset(alldata , datetime > "2007-02-01" &  datetime < "2007-02-03" )

# Create graph
png(file = "plot1.png")

hist(power$Global_active_power , xlab = "Global Active Power (kilowatts)" , main = "Global Active Power" , col="red" )
dev.off()

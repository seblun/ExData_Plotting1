## Open and prepare the data
data <- subset(read.csv("household_power_consumption.txt", sep=";"), Date=="1/2/2007"|Date=="2/2/2007")
# Make a new column with time in POSIXct class
datetime <- paste(data$Date, data$Time, sep=" ") 
data <- cbind(datetime,data)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
# Coerce column 4 (Global active power) to character and then to numeric
data[,4] <- as.numeric(as.character(data[,4]))

## Make plot2
png(file="plot2.png", width=480, height=480, units="px")
plot(data$datetime,data$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="n"
     )
lines(data$datetime,data$Global_active_power)
dev.off()

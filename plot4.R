## Open and prepare the data
data <- subset(read.csv("household_power_consumption.txt", sep=";"), Date=="1/2/2007"|Date=="2/2/2007")
# Make a new column with time in POSIXct class
datetime <- paste(data$Date, data$Time, sep=" ") 
data <- cbind(datetime,data)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
# Coerce needed columns to character and then to numeric
data[,4] <- as.numeric(as.character(data[,4])) # Global active power
data[,5] <- as.numeric(as.character(data[,5])) # Global reactive power
data[,6] <- as.numeric(as.character(data[,6])) # Voltage
data[,8] <- as.numeric(as.character(data[,8])) # Sub metering 1
data[,9] <- as.numeric(as.character(data[,9])) # Sub metering 2

## Make plot 4
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(data$datetime,data$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="n")
lines(data$datetime,data$Global_active_power)

plot(data$datetime,data$Voltage,xlab="datetime", ylab="Voltage", type="n")
lines(data$datetime,data$Voltage)

plot(data$datetime,data$Sub_metering_1,xlab="", 
     ylab="Energy sub metering", type="n")
lines(data$datetime,data$Sub_metering_1, col="black")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)

plot(data$datetime,data$Global_reactive_power,
     xlab="datetime", ylab="Global_reactive_power", type="n")
lines(data$datetime,data$Global_reactive_power)

dev.off()
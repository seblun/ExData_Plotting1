## Open and prepare the data
data <- subset(read.csv("household_power_consumption.txt", sep=";"), Date=="1/2/2007"|Date=="2/2/2007")
# Make a new column with time in POSIXct class
datetime <- paste(data$Date, data$Time, sep=" ") 
data <- cbind(datetime,data)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
# Coerce columns 8 and 9 (Sub metering) to character and then to numeric
data[,8] <- as.numeric(as.character(data[,8]))
data[,9] <- as.numeric(as.character(data[,9]))

## Make plot 3
png(file="plot3.png", width=480, height=480, units="px")
par(cex=1)
plot(data$datetime,data$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="n")
lines(data$datetime,data$Sub_metering_1, col="black")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()



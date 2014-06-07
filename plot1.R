## Open and prepare the data
data <- subset(read.csv("household_power_consumption.txt", sep=";"), Date=="1/2/2007"|Date=="2/2/2007")

# Coerce column 4 (Global active power) to character and then to numeric
data[,4] <- as.numeric(as.character(data[,4]))

## Make plot 1: histogram of global active power
png(file="plot1.png", width=480, height=480, units="px" )
par(cex=0.8, cex.lab=0.9, cex.axis=0.9)
hist(data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     breaks=12,
     col="red")
dev.off()

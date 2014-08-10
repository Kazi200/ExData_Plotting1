
data1 <- read.table("household_power_consumption.txt", sep = ';', header = TRUE )

data2 <- subset(data1,Date=="1/2/2007" | Date=="2/2/2007")

datetime <- paste(data2$Date, ' ' , data2$Time)

data2$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

for(i in c(3:9)) {data2[,i] <- as.numeric(as.character(data2[,i]))}


png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2), mar = c(14, 6, 2, 2), cex=.5)

############### Top Left ######################
plot(data2$datetime, data2$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")
lines(data2$datetime, data2$Global_active_power, type="S")
###############################################

############### Top Right #####################
plot(data2$datetime, data2$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")
lines(data2$datetime, data2$Voltage, type="S")
###############################################

############### Bottom Left ###################
plot(data2$datetime, data2$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(data2$datetime, data2$Sub_metering_1, col = "black", type = "S")
lines(data2$datetime, data2$Sub_metering_2, col = "red", type = "S")
lines(data2$datetime, data2$Sub_metering_3, col = "blue", type = "S")

legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
###############################################

############### Bottom Right ##################
plot(data2$datetime, data2$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")
lines(data2$datetime, data2$Global_reactive_power, type="S")
###############################################

dev.off()

data1 <- read.table("household_power_consumption.txt", sep = ';', header = TRUE )

data2 <- subset(data1,Date=="1/2/2007" | Date=="2/2/2007")

datetime <- paste(data2$Date, ' ' , data2$Time)

data2$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

for(i in c(3:9)) {data2[,i] <- as.numeric(as.character(data2[,i]))}

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(7, 6, 5, 4))

plot(data2$datetime, as.numeric(data2$Sub_metering_1), xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

lines(data2$datetime, as.numeric(data2$Sub_metering_1), col = "black", type = "S")

lines(data2$datetime, as.numeric(data2$Sub_metering_2), col = "red", type = "S")

lines(data2$datetime, as.numeric(data2$Sub_metering_3), col = "blue", type = "S")

legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

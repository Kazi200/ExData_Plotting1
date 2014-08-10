
data1 <- read.table("household_power_consumption.txt", sep = ';', header = TRUE )

data2 <- subset(data1,Date=="1/2/2007" | Date=="2/2/2007")

datetime <- paste(data2$Date, ' ' , data2$Time)

data2$datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

plot(data2$datetime , as.numeric(data2$Global_active_power)/500, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")

lines(data2$datetime ,as.numeric(data2$Global_active_power)/500, type="S")

dev.off()

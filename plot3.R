dr<-read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)
dr$DateTime = strptime(paste(dr$Date,dr$Time), "%d/%m/%Y %H:%M:%S")
start_date = strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
end_date = strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
dr <- dr[dr$DateTime >= start_date & dr$DateTime < end_date,]
png(filename = "plot3.png",
    width = 480, height = 480, units = "px");
plot(dr$DateTime, dr$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col="black")
lines(dr$DateTime, dr$Sub_metering_2, col="red")
lines(dr$DateTime, dr$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()
dr<-read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)
dr$DateTime = strptime(paste(dr$Date,dr$Time), "%d/%m/%Y %H:%M:%S")
start_date = strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
end_date = strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
dr <- dr[dr$DateTime >= start_date & dr$DateTime < end_date,]
png(filename = "plot1.png",
    width = 480, height = 480, units = "px");
hist(as.numeric(dr$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global active power (kilowatts)", 
     col = "red")
dev.off()
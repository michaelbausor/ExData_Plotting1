dr<-read.table('household_power_consumption.txt', sep = ";", header = TRUE, stringsAsFactors = FALSE)
dr$Date<-strptime(dr$Date,"%d/%m/%Y")
dr <- dr[dr$Date >= start_date,]
dr <- dr[dr$Date <= end_date,]
png(filename = "plot1.png",
    width = 480, height = 480, units = "px");
hist(as.numeric(dr$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global active power (kilowatts)", 
     col = "red")
dev.off()
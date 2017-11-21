    #setting the working directory (this is for my computer only)
    setwd("Desktop/courseraRdir/data")

    #get the appropriate data and change the class of the values and combine the date and time values
    power_data<-read.table("household_power_consumption.txt",header = TRUE, sep=";")
    feb_power_data<-power_data[power_data$Date=="1/2/2007"|power_data$Date=="2/2/2007",]
    feb_power_data[,3:9]<-apply(feb_power_data[,3:9],2,function(x) as.numeric(as.character(x)))
    feb_power_data$date_time<-paste(feb_power_data$Date,feb_power_data$Time)
    feb_power_data$date_time<-strptime(feb_power_data$date_time,tz = "GMT" ,format = "%d/%m/%Y%H:%M:%S")

    #creats plot4.png
    png(file="plot4.png")
    par(mfrow=c(2,2))
    plot(feb_power_data$date_time,feb_power_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
    plot(feb_power_data$date_time,feb_power_data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
    plot(feb_power_data$date_time,feb_power_data$Sub_metering_1,type = "l",xlab = "",ylab = "Enegy sub metering")
    lines(feb_power_data$date_time,feb_power_data$Sub_metering_2,type="l", col="red")
    lines(feb_power_data$date_time,feb_power_data$Sub_metering_3,type="l", col="blue")
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(1,1,1),col = c("black","red","blue"),bty = "n")
    plot(feb_power_data$date_time,feb_power_data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
    dev.off()
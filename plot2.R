    #setting the working directory (this is for my computer only)
    setwd("Desktop/courseraRdir/data")

    #get the appropriate data and change the class of the values and combine the date and time values
    power_data<-read.table("household_power_consumption.txt",header = TRUE, sep=";")
    feb_power_data<-power_data[power_data$Date=="1/2/2007"|power_data$Date=="2/2/2007",]
    feb_power_data[,3:9]<-apply(feb_power_data[,3:9],2,function(x) as.numeric(as.character(x)))
    feb_power_data$date_time<-paste(feb_power_data$Date,feb_power_data$Time)
    feb_power_data$date_time<-strptime(feb_power_data$date_time,format = "%d/%m/%Y%H:%M:%S")
    
    #creats plot2.png
    png(file="plot2.png")
    plot(feb_power_data$date_time,feb_power_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
    dev.off()
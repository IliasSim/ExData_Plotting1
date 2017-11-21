    #setting the working directory (this is for my computer only)
    setwd("Desktop/courseraRdir/data")

    #gets the appropriate data, changes the class of the values 
    power_data<-read.table("household_power_consumption.txt",header = TRUE, sep=";")
    feb_power_data<-power_data[power_data$Date=="1/2/2007"|power_data$Date=="2/2/2007",]
    feb_power_data[,3:9]<-apply(feb_power_data[,3:9],2,function(x) as.numeric(as.character(x)))
    feb_power_data$Date<-as.Date(strptime(as.character(feb_power_data$Date),tz="GMT",format = "%d/%m/%Y"))
    feb_power_data$Time<-strptime(as.character(feb_power_data$Time),format = "%H:%M:%S")

    #creats plot.1png
    png(file="plot1.png")
    hist(feb_power_data$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
    dev.off()
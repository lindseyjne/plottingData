## plot 4
#read the file and subset the dates we are interested in
power <- read.table("household_power_consumption.txt",skip=1,sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
powerDate <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# format the date and time variables
powerDate$Date <- as.Date(powerDate$Date, format="%d/%m/%Y")
powerDate$Time <- strptime(powerDate$Time, format="%H:%M:%S")
powerDate[1:1440,"Time"] <- format(powerDate[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powerDate[1441:2880,"Time"] <- format(powerDate[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plot the data
par(mfrow=c(2,2))
with(powerDate,{
  plot(powerDate$Time,as.numeric(as.character(powerDate$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(powerDate$Time,as.numeric(as.character(powerDate$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(powerDate$Time,powerDate$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(powerDate,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(powerDate,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(powerDate,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(powerDate$Time,as.numeric(as.character(powerDate$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#save the plot as a png file
dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()

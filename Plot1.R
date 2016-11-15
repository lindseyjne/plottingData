##plot 1
#read the file and subset the dates we are interested in
power <- read.table("D:/data/household_power_consumption.txt", header=T, sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
powerDate <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#creating a histogram
hist(as.numeric(as.character(powerDate$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#saving the histogram as a png file
dev.copy(png, file='plot1.png', width=480, height=480)
dev.off()

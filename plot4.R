if(!file.exists("c4p1_sks")){dir.create("c4p1_sks")}
setwd("./c4p1_sks")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("c4p1.zip")){download.file(url, destfile = "c4p1.zip")}
if(!file.exists("household_power_consumption.txt")){unzip("c4p1.zip")}
c4p1<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
data<-c4p1[c4p1$Date=="1/2/2007"|c4p1$Date=="2/2/2007",]
data$DaTi<-as.POSIXct(paste(data$Date, data$Time, sep=" "), format= "%d/%m/%Y %H:%M:%S")
library(gridExtra)
png("plot4.png", width = 480, height= 480)
par(mfrow=c(2,2))
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
plot(data$DaTi, data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
data$Voltage<-as.numeric(as.character(data$Voltage))
plot(data$DaTi, data$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
plot(data$DaTi, data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
points(data$DaTi, data$Sub_metering_2,type="l", col="red")
points(data$DaTi, data$Sub_metering_3,type="l", col="blue")
legend("topright",bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1,cex=1)
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
plot(data$DaTi, data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab = "datetime")
dev.off()

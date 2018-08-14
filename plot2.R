if(!file.exists("c4p1_sks")){dir.create("c4p1_sks")}
setwd("./c4p1_sks")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("c4p1.zip")){download.file(url, destfile = "c4p1.zip")}
if(!file.exists("household_power_consumption.txt")){unzip("c4p1.zip")}
c4p1<-read.delim("household_power_consumption.txt", sep=";", header=TRUE)
data<-c4p1[c4p1$Date=="1/2/2007"|c4p1$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
library(gridExtra)
png("plot2.png", width = 480, height= 480)
plot(data$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)",xaxt="n")
axis(1,at=c(0,1441,2880),labels = c("Thu", "Fri", "Sat"))
dev.off()
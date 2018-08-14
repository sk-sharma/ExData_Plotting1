if(!file.exists("c4p1_sks")){dir.create("c4p1_sks")}
setwd("./c4p1_sks")
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("c4p1.zip")){download.file(url, destfile = "c4p1.zip")}
if(!file.exists("household_power_consumption.txt")){unzip("c4p1.zip")}
c4p1<-read.delim("household_power_consumption.txt",sep=";",header=TRUE)
data<-c4p1[c4p1$Date=="1/2/2007"|c4p1$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
library(gridExtra)
png("plot1.png", width = 480, height= 480)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main ="Global Active Power")
dev.off()
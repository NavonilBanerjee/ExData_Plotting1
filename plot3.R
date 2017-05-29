setwd("C:/Users/Navonil/Documents/project") ##Work directory,data already downloaded & unzipped in this folder
plotData<-read.table("household_power_consumption.txt",header=TRUE,sep =";",na.strings = "?") ## as datapoints are seperated with ";" & missings values are denoted with "?"
plotData2<-plotData[which(plotData$Date %in% c("1/2/2007","2/2/2007")),]
rm(plotData) ## to reduce memory usages
class(plotData2$Date)
class(plotData2$Time)

##changing classes of Date & Time variables from factor to Date-time
SetTime <-strptime(paste(plotData2$Date, plotData2$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata<-cbind(SetTime,plotData2)
class(finaldata$SetTime)


##Plot3

png("plot3.png",width = 480,height = 480)
plot(finaldata$SetTime,finaldata$Sub_metering_1,type = "l",col="black",xlab = "",ylab = "Energy sub metering")
lines(finaldata$SetTime,finaldata$Sub_metering_2,type = "l",col="red")
lines(finaldata$SetTime,finaldata$Sub_metering_3,type = "l",col="blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,col=c("black","red","blue"))
dev.off()
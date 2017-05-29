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

##Plot2
png("plot2.png",width = 480,height = 480)
plot(finaldata$SetTime,finaldata$Global_active_power,type ="l",col="black",xlab=" ",ylab = "Global Active Power(kilowatts)")
dev.off()

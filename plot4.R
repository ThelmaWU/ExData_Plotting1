require(rio)
require(dplyr)
EPC<-import("Electricpowerconsumption.txt")
EPC<-EPC%>%
  filter(EPC$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  



png("plot4.png",height = 480,width=480)
par(mfrow=c(2,2))
plot(datetime, as.numeric(EPC$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)") 

plot(datetime, as.numeric(EPC$Voltage), type="l", xlab="datetime", ylab="Voltage")


plot(datetime, as.numeric(EPC$Sub_metering_1), type="l",ylab="Energy Submetering", xlab="")+
  lines(datetime, as.numeric(EPC$Sub_metering_2), type="l", col="red") + lines(datetime,as.numeric(EPC$Sub_metering_3),col="blue",type="l")+
  legend("topright", lty=1, lwd =3, col=c("black","red","blue"))

plot(datetime, as.numeric(EPC$Global_reactive_power), type="l", xlab="", ylab="Global Reactive Power (kilowatts)") 
dev.off()


dev.off()
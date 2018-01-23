require(rio)
require(dplyr)
EPC<-import("Electricpowerconsumption.txt")
EPC<-EPC%>%
  filter(EPC$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

png("plot3.png",height = 480,width=480)

plot(datetime, as.numeric(EPC$Sub_metering_1), type="l",ylab="Energy Submetering", xlab="")+
  lines(datetime, as.numeric(EPC$Sub_metering_2), type="l", col="red") + lines(datetime,as.numeric(EPC$Sub_metering_3),col="blue",type="l")+
  legend("topright", lty=1, lwd =3, col=c("black","red","blue"))
dev.off()
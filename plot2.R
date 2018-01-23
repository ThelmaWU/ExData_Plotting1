require(rio)
require(dplyr)
EPC<-import("Electricpowerconsumption.txt")
EPC<-EPC%>%
  filter(EPC$Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
png("plot2.png",height=480,width=480)
plot(datetime, as.numeric(EPC$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()
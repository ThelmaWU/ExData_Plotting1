require(rio)
require(dplyr)
EPC<-import("Electricpowerconsumption.txt")
EPC<-EPC%>%
  filter(EPC$Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png", width=480, height=480)
hist(as.numeric(EPC$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
library(dplyr)
df<-read.table("C:/Users/jasomo/Desktop/Exploratory_Data_Analysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "NA")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- filter(df, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
whole_number<-function(x)
{
  as.numeric(as.character(x))
}

dev.new()
dev.copy(png,file='plot3.png',width=480,height=480)
plot(df$timestamp,whole_number(df$Sub_metering_1),type='l',ylab ='Energy sub meetering',xlab='')
lines(df$timestamp,whole_number(df$Sub_metering_2),type='l',col='red')
lines(df$timestamp,whole_number(df$Sub_metering_3),type='l',col='blue')
legend("topright",col=c('black','red','blue'),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1),lwd=c(1,1))

dev.off()

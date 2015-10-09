
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
dev.copy(png,file='plot2.png',width=480,height=480)
plot(df$timestamp,as.numeric(as.character(df$Global_active_power)),type='l',xlab='',ylab="Global Active Power (kilowatts)")
dev.off()

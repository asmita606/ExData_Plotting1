dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
day1<-as.Date("2007-02-01","%Y-%m-%d") ; day2<-as.Date("2007-02-02","%Y-%m-%d")
dat<-dat[which(dat$Date==day1|dat$Date==day2),]

dates<-dat$Date
times<-dat$Time
dat_time<-paste(dates,times)
dat_time<-strptime(dat_time,"%Y-%m-%d %H:%M:%S")

dat$date_time<-dat_time

png("Plot4.png")
par(mfrow=c(2,2))
plot(dat$date_time,as.numeric(dat$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(dat$date_time,as.numeric(dat$Voltage),type="l",xlab="datetime",ylab="Voltage")

plot(dat$date_time,as.numeric(dat$Sub_metering_1),type="l",col="black",ylab="Energy sub metering",xlab="")
lines(dat$date_time,as.numeric(dat$Sub_metering_2),type="l",col="red")
lines(dat$date_time,as.numeric(dat$Sub_metering_3),type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

plot(dat$date_time,as.numeric(dat$Global_reactive_power),type="l",xlab="datetime",ylab="Global_Reactive_Power")

dev.off()

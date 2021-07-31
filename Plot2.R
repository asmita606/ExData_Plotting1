dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
day1<-as.Date("2007-02-01","%Y-%m-%d") ; day2<-as.Date("2007-02-02","%Y-%m-%d")
dat<-dat[which(dat$Date==day1|dat$Date==day2),]

dates<-dat$Date
times<-dat$Time
dat_time<-paste(dates,times)
dat_time<-strptime(dat_time,"%Y-%m-%d %H:%M:%S")

dat$date_time<-dat_time

png("Plot2.png")
plot(dat$date_time,as.numeric(dat$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

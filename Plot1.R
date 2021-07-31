dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
day1<-as.Date("2007-02-01","%Y-%m-%d") ; day2<-as.Date("2007-02-02","%Y-%m-%d")
dat<-dat[which(dat$Date==day1|dat$Date==day2),]

X<-dat$Global_active_power

png("Plot1.png")
hist(as.numeric(X),main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()

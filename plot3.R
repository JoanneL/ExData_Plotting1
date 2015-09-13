dat <- read.table("household_power_consumption.txt", sep=";",
                  col.names = c("Date","Time","Global_active_power","Global_reactive_powe","Voltage",
                                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings= "?",skip=66636, nrows=2880, header=TRUE)
Date <- as.Date(dat$Date,format = "%d/%m/%Y")
Time <- format(strptime(dat[,2], "%H:%M:%S"), "%H:%M:%S")
DateTime <- strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")
dat <- na.omit(data.frame(Date, Time, DateTime, dat[,3:9], stringsAsFactors = FALSE))

plot(dat$DateTime, dat[,7],type="n", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_1, type="l")
lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
legend(x="topright", lty=c(1,1,1), col=c("black", "red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.5)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
dat <- read.table("household_power_consumption.txt", sep=";",
                  col.names = c("Date","Time","Global_active_power","Global_reactive_powe","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings= "?",skip=66636, nrows=2880, header=TRUE)
Date <- as.Date(dat$Date,format = "%d/%m/%Y")
Time <- format(strptime(dat[,2], "%H:%M:%S"), "%H:%M:%S")
DateTime <- strptime(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")
dat <- na.omit(data.frame(Date, Time, DateTime, dat[,3:9], stringsAsFactors = FALSE))

plot(dat$DateTime,dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()


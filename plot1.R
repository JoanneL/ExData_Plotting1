dat <- read.table("household_power_consumption.txt", sep=";",
                  col.names = c("Date","Time","Global_active_power","Global_reactive_powe","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings= "?",skip=66637, nrows=2880)
##data is sampled by minute.According to the frst row data, it's simple to calculate that the 66638th row is 02/01/2007 00:00:00.
Date <- as.Date(dat$Date,format = "%d/%m/%Y")
Time <- format(strptime(dat[,2], "%H:%M:%S"),"%H:%M:%S")
dat <- data.frame(Date, Time, dat[,3:9])

hist(dat$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file ="plot1.png", height=480, width=480)
dev.off()


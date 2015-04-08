options(stringsAsFactors=F)
dat <- read.csv('household_power_consumption.txt', sep = ';',header = T, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
idx <- which(dat$Date == "2007-02-02"| dat$Date == "2007-02-01" )
keep <- dat
dat <- dat[idx,]
dat$Time <- strptime(paste(dat$Date,dat$Time,sep =","),"%Y-%m-%d,%H:%M:%S")


Sys.setlocale("LC_TIME", "English")
png('plot4.png')
with(dat, {
    par(mfrow = c(2, 2))
    plot(Time, Global_active_power,ylab = 'Global active power',type = 'l',xlab = '')
    plot(Time, Voltage,ylab = 'Voltage',xlab = 'datetime',type = 'l')
    plot(Time, Sub_metering_1, yaxt = 'n', type = 'l',xlab = '',ylab = 'Energy sub metering')
       axis(side=2, at=seq(0, 40, by=10))
       lines(Time,Sub_metering_2,col= 'red')
       lines(Time, Sub_metering_3, col = 'blue')
       legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lty = 1)

    plot(Time, Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime',type = 'l')
})
dev.off()

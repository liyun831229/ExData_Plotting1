options(stringsAsFactors=F)
dat <- read.csv('household_power_consumption.txt', sep = ';',header = T, na.strings="?", colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
idx <- which(dat$Date == "2007-02-02"| dat$Date == "2007-02-01" )
keep <- dat
dat <- dat[idx,]
dat$Time <- strptime(paste(dat$Date,dat$Time,sep =","),"%Y-%m-%d,%H:%M:%S")

Sys.setlocale("LC_TIME", "English")
png("plot2.png")
with(dat, plot(Time, Global_active_power,type = 'l',ylab = "Global active power (kilowatts)",xlab = ''))
dev.off()

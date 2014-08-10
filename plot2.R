library(data.table)
# Download, unpack and read data
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power_consumption.zip", method="curl")
#unzip("power_consumption.zip")
data <- fread("household_power_consumption.txt")

# Coerce casting
data$Global_active_power   <- sapply(data$Global_active_power,   as.numeric, USE.NAMES=FALSE)
data$Global_reactive_power <- sapply(data$Global_reactive_power, as.numeric, USE.NAMES=FALSE)
data$Voltage               <- sapply(data$Voltage,               as.numeric, USE.NAMES=FALSE)
data$Global_intensity      <- sapply(data$Global_intensity,      as.numeric, USE.NAMES=FALSE)
data$Sub_metering_1        <- sapply(data$Sub_metering_1,        as.numeric, USE.NAMES=FALSE)
data$Sub_metering_2        <- sapply(data$Sub_metering_2,        as.numeric, USE.NAMES=FALSE)
data$Sub_metering_3        <- sapply(data$Sub_metering_3,        as.numeric, USE.NAMES=FALSE)

# Subset only to 2007-02-01 and 2007-02-02
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

png("plot2.png", width=480, height=480, units="px")
plot(1:length(data$Global_active_power), data$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(side="1", at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()

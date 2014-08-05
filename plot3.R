# Read data
firstRow <- 66638  # First row with a 1/2/2007 date

data <- read.table('household_power_consumption.txt', sep = ";", skip = firstRow - 1, nrows = 60*24*2, stringsAsFactors = FALSE)

# Read column names
strnames <- readLines('household_power_consumption.txt', n = 1)

# Assign column names
splitnames <- strsplit(strnames, ";")
names(data) <- splitnames[[1]]

# Convert date and time variables to date/time classes

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- NULL
data$Time <- NULL

# Make plot 3

png(filename = "plot3.png", width = 480, height = 480)
with(data, plot(datetime, Sub_metering_1, type = "l", col = "black", 
	xlab = "", ylab = "Energy sub metering"))
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
	lty = c(1, 1), col = c("black", "red", "blue"))
dev.off()
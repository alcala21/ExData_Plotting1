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

# Make plot 1

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", 
	main = "Global Active Power",
	xlab = "Global Active Power (kilowatts)")
dev.off()
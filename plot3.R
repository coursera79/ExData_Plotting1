# Read data

all_hpc <- read.csv(
    'household_power_consumption.txt', 
    sep = ';', 
    na.strings = '?', 
    colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
)
hpc <- all_hpc[grep('^0?[12]/0?2/2007', all_hpc$Date, perl = TRUE),]
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Set up the PNG file to write to
png(filename = "plot3.png", width = 480, height = 480)

# Make the plot
plot(hpc$Time, hpc$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(hpc$Time, hpc$Sub_metering_2, col = 'red')
lines(hpc$Time, hpc$Sub_metering_3, col = 'blue')
legend(
    'topright', 
    legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
    lty = 'solid',
    col = c('black', 'red', 'blue')
)

# Close the file.
dev.off()

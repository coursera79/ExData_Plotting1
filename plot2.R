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
png(filename = "plot2.png", width = 480, height = 480)

# Make the plot
plot(hpc$Time, hpc$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')

# Close the file.
dev.off()

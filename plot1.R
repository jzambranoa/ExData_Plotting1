arch <- "household_power_consumption.txt"

# Load only the data from the dates 2007-02-01 and 2007-02-02.
data <- read.table(text = grep("^[1,2]/2/2007", 
                   readLines(arch), 
                   value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", 
                   header = TRUE)

# Create the PNG file with 480 x 480 pixels.
png("plot1.png", width = 480, height = 480)

# Construct the plot
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (killowatts)"
     )

# Close the PNG file device.
dev.off()

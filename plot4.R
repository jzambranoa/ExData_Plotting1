arch <- "household_power_consumption.txt"

# Load only the data from the dates 2007-02-01 and 2007-02-02.
data <- read.table(text = grep("^[1,2]/2/2007", 
                   readLines(arch), 
                   value = TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   sep = ";", 
                   header = TRUE)

# Create the PNG file with 480 x 480 pixels.
png("plot4.png", width = 480, height = 480)

# Create a new variable DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Construct 4 plots

par(mfrow = c(2,2))

# Plot 1
plot(data$DateTime, 
     data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l"
)

# Plot 2
plot(data$DateTime, 
     data$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l"
)

# Plot 3
plot(data$DateTime, 
     data$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")

lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

# Plot 4
plot(data$DateTime, 
     data$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l"
)

# Close the PNG file device.
dev.off()

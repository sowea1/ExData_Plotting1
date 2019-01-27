# Plot 4

#To clear the workspace environment
rm(list = ls()) 

#To load the data
hpcdata <- read.table("household_power_consumption/household_power_consumption.txt", 
                      header = T, sep = ";", na.strings = "?")

# convert date variable to date class
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")

#Convert dates and times
hpcdata$datetime <- strptime(paste(hpcdata$Date, hpcdata$Time), "%Y-%m-%d %H:%M:%S")
hpcdata$datetime <- as.POSIXct(hpcdata$datetime)

# Subset data (we only need data for the 1st and 2nd of February 2007)
hpcdata <- subset(hpcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 4
par(mfrow = c(2, 2))
with(hpcdata, {
  plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
       xlab = "")
  plot(Voltage ~ datetime, type = "l")
  plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
       xlab = "")
  lines(Sub_metering_2 ~ datetime, col = "Red")
  lines(Sub_metering_3 ~ datetime, col = "Blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bty = "n")
  
  plot(Global_reactive_power ~ datetime, type = "l")
}
)

# Save plot as PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
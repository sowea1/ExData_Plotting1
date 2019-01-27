# Plot 1

#To clear the workspace environment
rm(list = ls()) 

#To load the data
hpcdata <- read.table("household_power_consumption/household_power_consumption.txt", 
                      header = T, sep = ";", na.strings = "?")

# convert date variable to date class
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")

# Subset data ( we only need data for the 1st and 2nd of February 2007)
hpcdata <- subset(hpcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1
hist(hpcdata$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save plot as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
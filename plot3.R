#+++++++++++++++++++++++
# Name : plot3.R
# Author : Olivier CAZIN
# Date : 2016/02/29
#+++++++++++++++++++++++

# Set workspace
# setwd("C:/Users/Olivier/Desktop/MOOC Olivier/Course 4/data")

# Read file
  data_full <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

# Format Date
  data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

# Filter data
  data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert the Date  variable to Date/Time classes in R
  datetime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(datetime)

# Draw graph : plot 3
  with(data, {
            plot(Sub_metering_1~Datetime, type="l",
            ylab="Energy sub metering", xlab="")
            lines(Sub_metering_2~Datetime,col='Red')
            lines(Sub_metering_3~Datetime,col='Blue')
            })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()


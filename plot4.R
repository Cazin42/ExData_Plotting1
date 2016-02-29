#+++++++++++++++++++++++
# Name : plot4.R
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

# Draw graph : plot 4
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
             plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
             plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
             plot(Sub_metering_1~Datetime, type="l", 
             ylab="Energy sub metering", xlab="")
             lines(Sub_metering_2~Datetime,col='Red')
             lines(Sub_metering_3~Datetime,col='Blue')
             legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_reactive_Power",xlab="datetime")
            })

# Save file
 dev.copy(png, file="plot4.png", height=480, width=480)
 dev.off()



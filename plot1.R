#+++++++++++++++++++++++
# Name : plot1.R
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
  
# Draw graph : plot 1
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
      
# Save file
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
      
      
      
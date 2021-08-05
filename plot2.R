#### Jennifer Dusendang
#### John's Hopkins Exploratory Data Analysis 
#### Week 1 - Course Project 1
#### 8/5/2021
#### Graph 2

library(M3)

## Download and read in data file 
temp <- tempfile()
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", 
              temp)
hh_power <- read.table(unz(temp, "household_power_consumption.txt"), 
                       header = TRUE, sep = ";", dec = ".")
unlink(temp)

#restrict to only 2007-02-01 and 2007-02-02
hh_power$datetime <- combine.date.and.time(as.Date(hh_power$Date, "%d/%m/%Y"), 
                                           hh_power$Time)

hh_power_feb <- hh_power[hh_power$datetime >= as.Date("2007-02-01")
                         & hh_power$datetime < as.Date("2007-02-03"),]

#clean up a few variables / make them the appropriate datatypes
hh_power_feb$Global_active_power <- as.numeric(hh_power_feb$Global_active_power)
hh_power_feb$Global_reactive_power <- 
    as.numeric(hh_power_feb$Global_reactive_power)
hh_power_feb$Voltage <- as.numeric(hh_power_feb$Voltage)

#open png file location
png("plot2.png", width = 480, height = 480)

#make plot #2
plot(hh_power_feb$datetime, hh_power_feb$Global_active_power, type = 'l', 
     xlab = "", ylab = "Global Active Power (kilowatts)")

#close file location
dev.off()

# Creating the Fourth Plot: 4 plots in one
# Plot to be saved in plot4.png

# Loading Relevant Libraries for Table and Time manipulation
library(dplyr)


# Reading Data Set household_power_consumption.txt that is saved in working directory
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- tbl_df(household_power_consumption)
hpc2 <- filter(hpc, Date == "1/2/2007"|Date =="2/2/2007")



#Creating subplots one at a time and display them in grid form
len <- length(hpc2$Global_active_power)
len2 <- length(hpc2$Global_reactive_power)

#Grid Plots

par(mfrow=c(2,2))

     
#Global Active Power subplot 1
plot(hpc2$Global_active_power, type = "s", ylab = "Global Active Power (kilowatts)", xlab="", axes=FALSE)
            axis(1,  at = c(0, len/2,len),labels = c("Thu", "Fri", "Sat"))
            axis(2,  at = c(0,2,4,6) ,labels = c(0,2,4,6))

#Voltage subplot 2
plot(hpc2$Voltage, type = "s", ylab = "Voltage", xlab="datetime", axes=FALSE)
            axis(1,  at = c(0, len/2,len),labels = c("Thu", "Fri", "Sat"))
            axis(2,  at = c(0,234,238,242,246) ,labels = c(0,234,238,242,246))

  
#Energy sub metering subplot 3
plot(hpc2$Sub_metering_1, main = " ", ylab = "Energy sub metering", xlab="",type ="n",axes=FALSE) 
            points(hpc2$Sub_metering_1, col = "black", type ="s")
            points(hpc2$Sub_metering_2, col = "red", type ="s")
            points(hpc2$Sub_metering_3, col = "blue", type ="s")
            axis(1, c(0,len/2,len), labels=c("Thu","Fri","Sat"))
            axis(2, at= seq(0,30,by=10), labels=seq(0,30,by=10))
            legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"),bty="n")
            

#Global Reactive Power Subplot 4
plot(hpc2$Global_reactive_power, type = "s", xlab="datetime", axes=FALSE)
            axis(1,  at = c(0, len2/2,len2),labels = c("Thu", "Fri", "Sat"))
            axis(2,  at = c(0.0,0.1,0.2,0.3,0.4,0.5) ,labels = c(0.0,0.1,0.2,0.3,0.4,0.5))



#Export plot to plot4.png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

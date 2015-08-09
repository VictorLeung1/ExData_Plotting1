# Creating the Third Plot: Sub-meterings time series plots 
# Plot to be saved in plot3.png

# Loading Relevant Libraries for Table and Time manipulation
library(dplyr)


# Reading Data Set household_power_consumption.txt that is saved in working directory
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- tbl_df(household_power_consumption)
hpc2 <- filter(hpc, Date == "1/2/2007"|Date =="2/2/2007")

#Creating Sub-metering plots 
len <- length(hpc2$Global_active_power)
with(hpc2, plot(Sub_metering_1, main = " ", ylab = "Energy sub metering", xlab="",type ="n",axes=FALSE) )
with(hpc2, points(Sub_metering_1, col = "black", type ="s"))
with(hpc2, points(Sub_metering_2, col = "red", type ="s"))
with(hpc2, points(Sub_metering_3, col = "blue", type ="s"))
axis(1, c(0,len/2,len), labels=c("Thu","Fri","Sat"))
axis(2, at= seq(0,30,by=10), labels=seq(0,30,by=10))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"),cex=0.5)




#Export plot to plot3.png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

# Creating the Second Plot: Global Active Power (kilowatts) time series plot 
# Plot to be saved in plot2.png

# Loading Relevant Libraries for Table and Time manipulation
library(dplyr)


# Reading Data Set household_power_consumption.txt that is saved in working directory
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- tbl_df(household_power_consumption)
hpc2 <- filter(hpc, Date == "1/2/2007"|Date =="2/2/2007")

#Creating Plot
len <- length(hpc2$Global_active_power)
plot(hpc2$Global_active_power, type = "s", ylab = "Global Active Power (kilowatts)", xlab="", axes=FALSE)
axis(1,  at = c(0, len/2,len),labels = c("Thu", "Fri", "Sat"))
axis(2,   at =c(0,2,4,6), labels = c(0,2,4,6))

#Export plot to plot2.png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

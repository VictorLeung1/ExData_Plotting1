
# Creating the First Plot: Global Active Power kilowatts Frequency Histogram
# Plot to be saved in plot1.png

# Loading Relevant Libraries for Table and Time manipulation
library(dplyr)


# Reading Data Set household_power_consumption.txt that is saved in working directory
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- tbl_df(household_power_consumption)
hpc2 <- filter(hpc, Date == "1/2/2007"|Date =="2/2/2007")

#Creating Histogram (Frequency)
hist(hpc2$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main ="Global Active Power")

#Export to PNG file plot1.png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()






#1.Set Directory
#Home Com
setwd("D:/Dropbox/MOOC_Ongoing/Data_Science_Specialization_S/4_Exploratory Data Analysis/Projects/project_1")

#2. Read Data (Given that youhave the required file in your directory)
#   2.1 Read File
#   skip 66637 row since only using data 2007-02-01 to 2007-02-02
#   The data starts at 2006-12-06 17:24:00.  
#   From then until 2006-12-17 00:00:00 is 6 hr and 37 minutes = 397 minutes. 
#   Find number of whole Days from 2006-12-17 until 2007-02-01 = 46 
#   Total row = 46*24*60 + 397 = 66637
hpc <- read.table(file = "household_power_consumption.txt", 
                  sep = ";", 
                  skip = 66637,
                  nrows = 2880)
#   2.2 Define column name
colnames(hpc) <- c('Date', 'Time', 'Global_active_power', 
                   'Global_reactive_power', 'Voltage', 'Global_intensity', 
                   'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')

#3. Plot Graph
#   3.1 Plot 1 - histogram of Global_active_power
hist(hpc$Global_active_power, col = 'Red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
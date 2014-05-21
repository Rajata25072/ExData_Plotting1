#1.Set Directory
#   1.1 Home Com
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
#   3.3 Plot 3 - Single graph with multiple line btw weekday & Sub_metering
#       3.3.1 Create new column for showing weekday and cbind to main data
Date_Time <- seq_along(hpc$Date)
for (i in seq_along(hpc$Date)){
        Date_Time[i] <- paste(hpc$Date[i], hpc$Time[i])
}
Date_Time_F <- seq_along(hpc$Date)
Date_Time_F <- strptime(Date_Time, format= "%d/%m/%Y %H:%M:%S")
hpc <- cbind(hpc, Date_Time_F)
#       3.3.2 Create Graph
par(mar = c(3, 4, 2, 2))
with(hpc, {
        #             1) Create core graph
        plot(hpc$Date_Time_F, hpc$Sub_metering_1, main = "", type = "l", col = "Black"
             , xlab = "", ylab = "Energy sub metering")
        #             2) Add up 2 more lines
        lines(hpc$Date_Time_F, hpc$Sub_metering_2, main = "", type = "l", col = "Red")
        lines(hpc$Date_Time_F, hpc$Sub_metering_3, main = "", type = "l", col = "Blue")
        #             3) Set legend
        legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7, pt.cex = 1,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
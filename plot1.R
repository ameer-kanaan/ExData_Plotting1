#read the file
df <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE, header = T)

#returns the first instance of 1/2/2007
first <- match("1/2/2007", df$Date)

#returns the last instance of 2/2/2007
last <- which(df$Date %in% "2/2/2007")[length(which(df$Date %in% "2/2/2007"))]

# only select the needed date frame (helps in lowering RAM consumption)
df1 <- df[first:last,]

#plot the histogram
png(file = "plot1.png",width=480,height=480)
hist(df1$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red",main= "Global Active Power")
dev.off()

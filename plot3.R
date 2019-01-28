#read the file
df <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE, header = T)

#returns the first instance of 1/2/2007
first <- match("1/2/2007", df$Date)

#returns the last instance of 2/2/2007
last <- which(df$Date %in% "2/2/2007")[length(which(df$Date %in% "2/2/2007"))]

# only select the needed date range (helps in lowering RAM consumption, makes processing more effecient)
df1 <- df[first:last,]

#plot construction
png(file = "plot3.png",width=480,height=480)
plot(df1$datime, df1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
points(df1$datime, df1$Sub_metering_1, "l")
points(df1$datime, df1$Sub_metering_2, "l", col ="red")
points(df1$datime, df1$Sub_metering_3, "l", col ="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
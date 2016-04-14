# Loading and cleaning Data
raw <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.string="?")
raw$Date <- as.Date(raw$Date, format="%d/%m/%Y")
energy <- subset(raw, Date >= "2007-02-01" & Date <= "2007-02-02")
rm(raw)
message("Data loaded. Created Image...")
png(file="plot1.png",width=480, height=480)
hist(energy$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main= "Global Active Power"
     )
dev.off()
rm(energy)
message("Successful.")
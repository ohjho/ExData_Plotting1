# Loading and cleaning Data
fname <- "household_power_consumption.txt"
if (!file.exists(fname)){
  message(fname, " not found. Exiting script...")
  stop("See information on the dataset from README.md or download here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
}
raw <- read.table(fname, header=TRUE,sep=";", na.string="?")
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
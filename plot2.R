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

# Image Creation
message("Data loaded. Created Image...")
png(file="plot2.png",width=480, height=480)
with(energy,plot(as.POSIXct(paste(Date,Time)),Global_active_power,
                 ylab="Global Active Power (kilowatts)",
                 xlab="",
                 type="l")
     )
dev.off()
rm(energy)
message("Successful.")
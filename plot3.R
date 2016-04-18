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
png(file="plot3.png",width=480, height=480)
with(energy,plot(as.POSIXct(paste(Date,Time)),Sub_metering_1,
                 ylab="Energy sub metering",
                 xlab="",
                 type="l",
                 col="black")
     )
with(energy,points(as.POSIXct(paste(Date,Time)),Sub_metering_2,
                 type="l",
                 col="red")
)
with(energy,points(as.POSIXct(paste(Date,Time)),Sub_metering_3,
                   type="l",
                   col="blue")
)
legend("topright", col=c("black","red","blue"),
       lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
rm(energy)
message("Successful.")
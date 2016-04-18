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
png(file="plot4.png",width=480, height=480)
org.par.mfrow<- par("mfrow")
par(mfrow= c(2,2))

message("Plotting Chart 1")
with(energy,plot(as.POSIXct(paste(Date,Time)),Global_active_power,
                 ylab="Global Active Power",
                 xlab="",
                 type="l")
)

message("Plotting Chart 2")
with(energy,plot(as.POSIXct(paste(Date,Time)),Voltage,
                 xlab="datetime",
                 type="l")
)

message("Plotting Chart 3")
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
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",
       border=NA,
       cex=0.75)

message("Plotting chart 4")
with(energy,plot(as.POSIXct(paste(Date,Time)),Global_reactive_power,
                 xlab="datetime",
                 type="l")
)

par(mfrow= org.par.mfrow)
dev.off()
rm(energy)
message("Successful.")

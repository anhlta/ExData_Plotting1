plot4 <- function(filepath) {
    ## Read data in
    d <- read.csv(file=filepath, header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = '?')
    
    ## Add 'Date_C' as conversion value of Date type of column Date
    d <- within(data, "Date_C" <- as.Date(Date, format = "%d/%m/%Y"))
    
    ## Subset data from the dates 2007-02-01 and 2007-02-02
    sub <- subset(d, Date_C >= "2007-02-01" & Date_C <= "2007-02-02")
    
    ## Add 'DateTime' as the combination of Date and Time columns and convert it to Date/Time data type
    sub <- within(sub, "DateTime" <- strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
    
    ## Open 'png' device
    png(file = "plot4.png")
    ## Create plot and send it to device
    ## Setup plot layouts
    par(mfrow = c(2,2))
    ## plot 1
    plot(sub$DateTime, sub$Global_active_power, type="l", ylab = "Global Active Power", xlab = "");
    
    ## plot 2
    plot(sub$DateTime, sub$Voltage, type="l", ylab = "Voltage", xlab = "datetime");
    
    ## plot 3
    plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
    lines(sub$DateTime, sub$Sub_metering_2, type="l", col = "red")
    lines(sub$DateTime, sub$Sub_metering_3, type="l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),  lty = 1, bty = 'n')
    
    ## plot 4
    plot(sub$DateTime, sub$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime");
    
    ## Close device
    dev.off()
}
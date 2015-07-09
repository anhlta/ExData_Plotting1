plot2 <- function(filepath) {
    ## Read data in
    d <- read.csv(file=filepath, header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = '?')
    
    ## Add 'Date_C' as conversion value of Date type of column Date
    d <- within(data, "Date_C" <- as.Date(Date, format = "%d/%m/%Y"))
    
    ## Subset data from the dates 2007-02-01 and 2007-02-02
    sub <- subset(d, Date_C >= "2007-02-01" & Date_C <= "2007-02-02")
    
    ## Add 'DateTime' as the combination of Date and Time columns and convert it to Date/Time data type
    sub <- within(sub, "DateTime" <- strptime(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))
    
    ## Open 'png' device
    png(file = "plot2.png")
    ## Create plot and send it to device
    plot(sub$DateTime, sub$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "");
    ## Close device
    dev.off()
}



plot1 <- function(filepath) {
    ## Read data in
    d <- read.csv(file=filepath, header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = '?')
    
    ## Add 'Date_C' column as conversion value of Date type of column Date
    d <- within(data, "Date_C" <- as.Date(Date, format = "%d/%m/%Y"))
    
    ## Subset data from the dates 2007-02-01 and 2007-02-02
    sub <- subset(d, Date_C >= "2007-02-01" & Date_C <= "2007-02-02")
    
    ## Open 'png' device
    png(file = "plot1.png")
    ## Create plot and send it to device
    hist(sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")
    ## Close device
    dev.off()
    
}
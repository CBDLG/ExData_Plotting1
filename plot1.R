## plot1 function reads the specified file,
## being "household_power_consumption.txt" the  default file name value,
## and creates the first graph of the assignment

plot1 <- function (fname = "household_power_consumption.txt") {
        
        ## Read Column Names
        hd<- read.csv2(fname, header = FALSE, nrows = 1,stringsAsFactors=FALSE)
        
        ## Read data for the dates 2007-02-01 and 2007-02-02
        
        cclas <- c("factor","factor",rep("numeric",7))
        d1 <-read.csv(fname, header = FALSE, sep=";",colClasses = cclas,na.strings = "?", nrows = 2880,skip = 66637)
        
        ## Replace column names
        colnames(d1) <- hd[1,]
        
        ## Build Histogram and save it to a PNG file
        t1 <- "Global Active Power"
        t2 <- "(kilowatts)"
        png (file = "plot1.png", width = 480, height = 480, units = "px")
        hist(d1$Global_active_power, col= "red",main= t1, xlab = paste(t1,t2,sep = " ") )
        dev.off()
        }
        
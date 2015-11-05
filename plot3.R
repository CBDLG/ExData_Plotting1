## plot3 function reads the specified file,
## being "household_power_consumption.txt" the  default file name value,
## and creates the third graph of the assignment

plot3 <- function (fname = "household_power_consumption.txt") {
        library(datasets)
        
        ## Read Column Names
        hd<- read.csv2(fname, header = FALSE, nrows = 1,stringsAsFactors=FALSE)
        
        ## Read data for the dates 2007-02-01 and 2007-02-02
        
        cclas <- c("factor","factor",rep("numeric",7))
        d1 <-read.csv(fname, header = FALSE, sep=";",colClasses = cclas,na.strings = "?", nrows = 2880,skip = 66637)
        
        ## Replace column names
        colnames(d1) <- hd[1,]
        
        ## Merge Date and Time into Date column as a date type data 
        d1 [,1] <- data.frame(strptime(paste(d1[,1],d1[,2],sep =" "), "%d/%m/%Y %H:%M:%S"))
        d1 [,3] <- data.frame(as.numeric(d1[,3]))
        
        ## Build Graph and save it to a PNG file
        t1 <- "Energy sub metering"
        png (file = "plot3.png", width = 480, height = 480, units = "px")
        with(d1,plot(Date,Sub_metering_1, type = "l",xlab ="", ylab = t1, col = "black"))
        with(d1,lines(Date,Sub_metering_2,type = "l",xlab ="", ylab = "", col = "red"))
        with(d1,lines(Date,Sub_metering_3,type = "l",xlab ="", ylab = "", col = "blue"))
        
        ## Add legend
        vlist <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        legend("topright", lwd = 2, col = c("black","red","blue"), legend = vlist)
        dev.off()
        
        }
        
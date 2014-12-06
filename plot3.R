
# I not download this file directly into my current filder as it was a zio file. so I had to download it, unzip it and then
# and then place it inm my working director.  One you dwonload the file from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#and place the txt file in your  R working directory, Script should work fine.

filename <- "household_power_consumption.txt";

filepath <- paste(getwd(),filename, sep="\\");

df <- read.table(filepath, header=TRUE, sep = ";", stringsAsFactors = FALSE);

subdf1 <- subset(df, Date == "1/2/2007"  )
subdf2 <- subset(df, Date == "2/2/2007" )
subdf3 <- rbind(subdf1,  subdf2)


requiredCol = "Global_active_power";
subdf3[[requiredCol]] <- as.numeric(subdf3[[requiredCol]] )
subdf3[["Sub_metering_1"]] <- as.numeric(subdf3[["Sub_metering_1"]] )
subdf3[["Sub_metering_2"]] <- as.numeric(subdf3[["Sub_metering_2"]] )


x <- as.POSIXct(strptime(paste(subdf3$Date, subdf3$Time), format="%d/%m/%Y %H:%M:%S"))

plot(x, subdf3$Sub_metering_1,"l", col="black" , xlab="", ylab = "", ylim=c(0,38))
par(new=T)
plot(x, subdf3$Sub_metering_2,"l", col="red" , xlab="", ylab = "", ylim=c(0,38))
par(new=T)
plot(x, subdf3$Sub_metering_3,"l", col="blue" , xlab="", ylab = "Energy Sub Metering",ylim=c(0,38))
par(new=T)
legend("topright",   # places a legend at the appropriate place 
c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), # puts text in the legend 
lwd=c(3,3,3),lty=c(1,1,1),col=c("black","red","blue"),cex=0.8 ) # gives the legend lines the correct color and width

png("plot3.png", width = 480, height = 480 )

plot(x, subdf3$Sub_metering_1,"l", col="black" , xlab="", ylab = "", ylim=c(0,38))
par(new=T)
plot(x, subdf3$Sub_metering_2,"l", col="red" , xlab="", ylab = "", ylim=c(0,38))
par(new=T)
plot(x, subdf3$Sub_metering_3,"l", col="blue" , xlab="", ylab = "Energy Sub Metering",ylim=c(0,38))
par(new=T)
legend("topright",   # places a legend at the appropriate place 
       c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), # puts text in the legend 
       lwd=c(3,3,3),lty=c(1,1,1),col=c("black","red","blue"),cex=0.8 ) # gives the legend lines the correct color and width
dev.off();

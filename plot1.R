## The plot1() function will create a PNG file showing a plot of Global Active
## Power with frequency plotted against kilowatts.
## PNG image should be 480x480 and have bars in red.

## Read outcome data ignoring missing values (coded as '?')
## Use read.table!!

dt <- read.table('household_power_consumption.txt', header = TRUE, sep=';',
                     na.strings = '?')

## Fix the dates and times
dt$Date <- as.Date(dt$Date , '%d/%m/%Y')
dt$Time <- paste(dt$Date, dt$Time, sep=' ')
dt$Time <- strptime(dt$Time, '%Y-%m-%d %H:%M:%S')

## Subset the data table
## Limit to dates between 2007-02-01 and 2007-02-02
startDate = as.Date('01/02/2007', format='%d/%m/%Y')
endDate = as.Date('02/02/2007', format='%d/%m/%Y')
dt = dt[dt$Date >= startDate & dt$Date <= endDate, ]

## Create output file
png('plot1.png', width = 480, height = 480)
hist(dt$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts)', col='red')
dev.off()
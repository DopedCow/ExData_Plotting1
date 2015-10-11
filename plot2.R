## The plot2() function will create a PNG file showing a plot of Global Active
## Power in kilowatts plotted against time.
## PNG image should be 480x480.

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
png('plot2.png', width = 480, height = 480)
plot(dt$Time, dt$Global_active_power, type='l', xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()
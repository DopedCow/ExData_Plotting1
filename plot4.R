## The plot2() function will create a PNG file showing four plots (all against
## time) of Global Actove Power, Voltage, Energy sub metering and Global
## Reactive Power.
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

## Create output file (composed by 4 plots in a canvas)
png('plot4.png', width = 480, height = 480)

## Setup canvas
par(mfcol=c(2,2))

## Plot 1 - top left
plot(dt$Time, dt$Global_active_power, type='l', xlab='',
     ylab='Global Active Power')

## Plot 2 - bottom left
plot(dt$Time, dt$Sub_metering_1, type='l', xlab='',
     ylab='Energy sub metering')
lines(dt$Time, dt$Sub_metering_2, col='red')
lines(dt$Time, dt$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2',
                            'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lwd=par('lwd'), bty='n')

## Plot 3 - top right
plot(dt$Time, dt$Voltage, type='l', xlab='datetime', ylab='Voltage')

## Plot 4 - bottom right
plot(dt$Time, dt$Global_reactive_power, type='l', xlab='datetime',
     ylab='Global_reactive_power')

dev.off()
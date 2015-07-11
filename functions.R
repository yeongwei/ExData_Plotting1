## Reads data defaults from "./household_power_consumption.txt"
## Subset data for dates between 02/02/2007 and 01/02/2007
## Add new column DateTime
##
## Args:
##  fileName: "household_power_consumption.txt" location
##
getElectricPowerConsumptionData <- 
  function(
    fileName = "./household_power_consumption.txt") {
    
    # Function constants
    hasHeader <- TRUE
    saperatorStr <- ";"
    stringsAsFactorFlag <- FALSE 
    dateFormat <- "%d/%m/%Y"
    timeFormat <- "%H:%M:%S"
    dateTimeFormat <- paste("%Y-%m-%d", " ", timeFormat, sep = "")
    dateUpperBoundStr <- "02/02/2007"
    dateLowerBoundStr <- "01/02/2007"
    
    # Read data from file into variable
    elecPwrConsumption <- 
      read.table(
        file = fileName, header = hasHeader, 
        sep = saperatorStr, stringsAsFactors = stringsAsFactorFlag)
    
    # Make Date column as Date/Time type
    elecPwrConsumption$Date <- 
      strptime(elecPwrConsumption$Date, format = dateFormat)
    
    # Define upper and lower bound 
    dateUpperBound <- strptime(dateUpperBoundStr, format = dateFormat)
    dateLowerBound <- strptime(dateLowerBoundStr, format = dateFormat)
    
    # Subset data with upper and lower bound defined
    elecPwrConsumption <-
      elecPwrConsumption[
        elecPwrConsumption$Date >= dateLowerBound &
          elecPwrConsumption$Date <= dateUpperBound, ]
    
    # Change column types accordingly
    elecPwrConsumption$Global_active_power <-
      as.numeric(elecPwrConsumption$Global_active_power)
    
    elecPwrConsumption$Voltage <-
      as.numeric(elecPwrConsumption$Voltage)
    
    elecPwrConsumption$Sub_metering_1 <-
      as.numeric(elecPwrConsumption$Sub_metering_1)
    elecPwrConsumption$Sub_metering_2 <-
      as.numeric(elecPwrConsumption$Sub_metering_2)
    elecPwrConsumption$Sub_metering_3 <-
      as.numeric(elecPwrConsumption$Sub_metering_3)
    
    elecPwrConsumption$Global_reactive_power <-
      as.numeric(elecPwrConsumption$Global_reactive_power)
    
    # Create DateTime column
    dateTimeStrings <- 
      paste(
        as.character(elecPwrConsumption$Date),
        " ",
        as.character(elecPwrConsumption$Time),
        sep = "")
    
    dateTimeColumn <- strptime(dateTimeStrings, format = dateTimeFormat)
    elecPwrConsumption <-
      cbind(elecPwrConsumption, DateTime = dateTimeColumn)
    
    elecPwrConsumption
  }

## Plots the histogram for column Global_active_power
##
## Args:
##  data: from getElectricPowerConsumptionData()
##
globalActivePowerHistPlot <- function(data) {
  hist(
    data$Global_active_power, 
    main = "Global Active Power",
    col = "red", xlab = "Global Active Power (kilowatts)")
}

## Plots the line graph for column Global_active_power over Column DateTime
##
## Args:
##  data: from getElectricPowerConsumptionData()
##
globalActivePowerLinePlot <- function(data) {
  plot(
    data$Global_active_power ~ data$DateTime,
    type = "l", 
    xlab = "", ylab = "Global Active Power (kilowatts)")
}

## Plots a single line graph consist for column Sub_metering_1, Sub_metering_2
## and Sub_metering_3 over column DateTime with legend
##
## Args:
##  data: from getElectricPowerConsumptionData()
##  legendTransparent: if TRUE then legend is transparent
##
subMeteringsPlot <- function(data, legendTransparent = FALSE) {
  plot(
    data$Sub_metering_1 ~ data$DateTime, 
    type = "l",
    xlab = "", ylab = "Energy sub metering")
  
  lines(
    data$Sub_metering_2 ~ data$DateTime,
    col = "red")
  
  lines(
    data$Sub_metering_3 ~ data$DateTime,
    col = "blue")
  
  btyFlag <- "o"
  if(legendTransparent) {
    btyFlag <- "n"
  }
  
  legend(
    "topright", 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = c(1, 1), bty = btyFlag)
}

## Plots the line graph consist for column Voltage over column DateTime
##
## Args:
##  data: from getElectricPowerConsumptionData()
##
voltagePlot <- function(data) {
  plot(
    data$Voltage ~ data$DateTime, 
    type = "l", 
    xlab = "datetime", ylab = "Voltage")
}

## Plots the line graph consist for column Global_Reactive_Power over column DateTime
##
## Args:
##  data: from getElectricPowerConsumptionData()
##
globalReactivePowerPlot <- function(data) {
  plot(
    data$Global_reactive_power ~ data$DateTime,  
    type = "l", 
    xlab = "datetime", ylab = "Global_reactive_power")
}

## Prapre the PNG device, a wrapper to png(...)
##
## Args:
##  fileName: file name of the PNG
##
preparePng <- function(fileName) {
  png(
    filename = fileName, 
    width = 480, height = 480,
    units = "px", bg = "transparent")
}

## A wrapper call to the dev.off()
##
## Args:
##  Nil
##
closePng <- function() {
  dev.off()
}
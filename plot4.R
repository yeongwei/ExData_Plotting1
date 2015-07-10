##  Coursera Data Science Specialization
##  Exploratory Data Analysis Course Project 1
##  Source code to produce "Plot 4"
##

source("./functions.R")
completeData <- getElectricPowerConsumptionData()

preparePng("./plot4.png")

par(mfrow = c(2, 2))

globalActivePowerLinePlot(completeData)
voltagePlot(completeData)
subMeteringsPlot(completeData, TRUE)
globalReactivePowerPlot(completeData)

closePng()
##  Coursera Data Science Specialization
##  Exploratory Data Analysis Course Project 1
##  Source code to produce "Plot 2"
##

source("./functions.R")
completeData <- getElectricPowerConsumptionData()

preparePng("./plot2.png")
globalActivePowerLinePlot(completeData)
closePng()
##  Coursera Data Science Specialization
##  Exploratory Data Analysis Course Project 1
##  Source code to produce "Plot 3"
##

source("./functions.R")
completeData <- getElectricPowerConsumptionData()

preparePng("./plot3.png")
subMeteringsPlot(completeData)
closePng()
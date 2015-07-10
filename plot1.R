##  Coursera Data Science Specialization
##  Exploratory Data Analysis Course Project 1
##  Source code to produce "Plot 1"
##

source("./functions.R")
completeData <- getElectricPowerConsumptionData()

preparePng("./plot1.png")
globalActivePowerHistPlot(completeData)
closePng()
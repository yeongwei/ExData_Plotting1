workingDirectory <- "D:\\development\\datasciencecoursera\\4-exploratory-data-analysis"
setwd(workingDirectory)

# Memory usage
install.packages("pryr")
library(pryr)

source("../../ExploratoryDataAnalysis/functions.R")

completeData <- getElectricPowerConsumptionData()
str(completeData)

# PLOT 1
preparePng("./plot1.png")
globalActivePowerHistPlot(completeData)
closePng()

# PLOT 2
preparePng("./plot2.png")
globalActivePowerLinePlot(completeData)
closePng()

# PLOT 3
preparePng("./plot3.png")
subMeteringsPlot(completeData)
closePng()

# PLOT 4
preparePng("./plot4.png")
par(mfrow = c(2, 2))
globalActivePowerLinePlot(completeData)
voltagePlot(completeData)
subMeteringsPlot(completeData, TRUE)
globalReactivePowerPlot(completeData)
closePng()

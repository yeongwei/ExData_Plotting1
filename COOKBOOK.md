# Introduction

This section describes how the scripts associated to this repository works.

# R Scripts

1. `functions.R`
2. `plot1.R`
3. `plot2.R`
4. `plot3.R`
5. `plot4.R`

## functions.R

This script consist of various functions that are used by `plot1.R`, `plot2.R`, `plot3.R` and `plot4.R` to generate plots into PNG file.

### getElectricPowerConsumptionData(fileName = "./household_power_consumption.txt")

This functions reads the data from the file `household_power_consumption.txt` that defaults to the current working directory.

It first converts the `Date` column into `POSIXlt` type then subset by the date between "02/02/2007" and "01/02/2007", after that all columns types are revised into appropriate types, lastly a new column `DateTime` is created based on the existing `Date` and `time` columns.

### globalActivePowerHistPlot(data)

Creates the "Plot 1" which is a Histogram for the columns `Global_active_power`.

### globalActivePowerLinePlot(data)

Creates the "Plot 2" which is a Line Graph between columns `Global_active_power` over `DateTime`.

### subMeteringsPlot(data, legendTransparent = FALSE)

Creates the "Plot 3" which is a Line Graph between columns `Sub_metering_1`, `Sub_metering_2` and `Sub_metering_3` over `DateTime`. An argument `legendTransparent` flag to decide if the legend should have border.

### voltagePlot(data)

Creates a Line Graph between column `Voltage` and `DateTime` to be used in "Plot 4".

### globalReactivePowerPlot(data)

Creates a Line Graph between column `Global_reactive_power` and `DateTime` to be used in "Plot 4".

### preparePng(fileName)

A wrapper function for the `png` function.

### closePng

A wrapper function for the `dev.off()` function.

# How to run ?

1. Pull this repository into local environment
2. Check if the following files are in current working directory
      * `household_power_consumption.txt`
	  * `functions.R`
	  * `plot1.R`
	  * `plot2.R`
	  * `plot3.R`
	  * `plot4.R`
3. Execute the following command

```
source("./plot1.R");
source("./plot2.R");
source("./plot3.R");
source("./plot4.R");
```

# Expected Output Files

1. plot1.png
2. plot2.png
3. plot3.png 
4. plot4.png


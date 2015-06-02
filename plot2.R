## This function generates the second of a set of 4 plots based on the Electric 
## Power Consumption dataset. 
## This script relies on the loadData() function from the plot1.R file.
## Please ensure the correct version of plot1.R is in the working directory
## to source the loadData() function.

plot2 <- function() {
  
  # Load data
  source("plot1.R")
  data <- loadData()
  
  # Open PNG
  
  ## N.B. The comparator file in the git repository is actually 504 x 504, but
  ## the instructions request 480 x 480
  ## Replace both the values of 480 for width and height with 504 for closest
  ## similarity
  
  png(file = "plot2.png", bg="transparent", width = 480, height = 480)
  
  # Plot Data
  x <- data$DateTime
  y <- data$Global_active_power
  xlab <- ""
  ylab <- "Global Active Power (kilowatts)"  
  plot(x, y, type = "n", xlab = xlab, ylab = ylab)
  lines(x, y)
  
  # Close Plot
  dev.off()
  
}
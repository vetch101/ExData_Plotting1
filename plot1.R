## This file contains 2 functions. The first  pulls down the Electric Power 
## Consumption dataset and the second generates the first of a set of 4 plots 
## based on that data. 

# Data loading function for all 4 plots
# Usage: data <- loadData()

loadData <- function() {
  
  # Load data
  filename <- "household_power_consumption.txt"
  header <- read.csv2(filename, header = TRUE, nrow = 1)
  
  # Identify skip and nrow values in advance using:  
  # first = grep("^[12]/2/2007", readLines(filename))[1]
  # last = grep("^3/2/2007", readLines(filename))[1]
  # skip = first - 1
  # nrow = last - first
  # closeAllConnections()
  
  data <- read.csv2(filename, header = FALSE,
                    stringsAsFactors=FALSE, skip = 66637, nrow = 2880)
  
  # Set names to names based on the header
  
  names(data) <- names(header)
  
  # Combine Date and Time columns into DateTime column
  
  data <- cbind(DateTime = paste(data$Date, data$Time), data)
  
  # Convert DateTime to POSIXct
  
  data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  # Drop original Date and Time columns
  
  data <- data[ , c(1,4:10)]
  
  # Set all other columns to numeric
  
  data[,2:8] <- sapply(data[,2:8], as.numeric)  

  # Return dataset
  
  return(data)
  
}

# Function to load first plot

plot1 <- function() {

  # Load data
  
  data <- loadData()
  
  # Open Plot
  
  ## N.B. The comparator file in the git repository is actually 504 x 504, but
  ## the instructions request 480 x 480
  ## Replace both the values of 480 for width and height with 504 for closest
  ## similarity
  
  png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
  
  # Plot Data
  color <- "red"
  title <- "Global Active Power"
  xlab <- "Global Active Power (kilowatts)"
  hist(data$Global_active_power, col = color, main = title, xlab = xlab)
  
  # Close Plot
  dev.off()

}
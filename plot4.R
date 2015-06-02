## This function generates the fourth of a set of 4 plots based on the Electric 
## Power Consumption dataset. 
## This script relies on the loadData() function from the plot1.R file.
## Please ensure the correct version of plot1.R is in the working directory
## to source the loadData() function.

plot4 <- function() {
  
# Load data
source("plot1.R")
data <- loadData()

# Open PNG

## N.B. The comparator file in the git repository is actually 504 x 504, but
## the instructions request 480 x 480
## Replace both the values of 480 for width and height with 504 for closest
## similarity

png(file = "plot4.png", bg="transparent", width = 480, height = 480)

# Set parameters for plots and margins
par(mfcol = c(2,2), mar = c(4,4,2,2))

# plot 1
x <- data$DateTime
y <- data$Global_active_power
xlab <- ""
ylab <- "Global Active Power"  
plot(x, y, type = "n", xlab = xlab, ylab = ylab)
lines(x, y)

# Plot 2
x <- data$DateTime
y <- data$Sub_metering_1
xlab <- ""
ylab <- "Energy sub metering"  
plot(x, y, type = "n", xlab = xlab, ylab = ylab)
colors <- c("black", "red", "blue")
names <- names(data)

# Step through Sub_metering columns and draw lines

for (i in 1:3) {
  metering <- i + 5
  lines(x, data[, metering], col = colors[i])
}

# Add legend

legend("topright", col = colors, cex = 0.6, legend = names[6:8], lty = 1)       


# Plot 3
x <- data$DateTime
y <- data$Voltage
xlab <- "datetime"
ylab <- "Voltage"
plot(x, y, type = "n", xlab = xlab, ylab = ylab)
lines(x,y)

# Plot 4
x <- data$DateTime
y <- data$Global_reactive_power
xlab <- "datetime"
ylab <- "Global_reactive_power"
plot(x, y, type = "n", xlab = xlab, ylab = ylab)
lines(x,y, lwd = 0.2)


# Close PNG
dev.off()
  
}
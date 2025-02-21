# Playing with AI for R graphing

## Qestion to AI
Make a simple R analysis to evaluate the change of temperature in time.

``` r
# Load necessary libraries
library(ggplot2)

# Example data: Timestamp and temperature readings
data <- data.frame(
  timestamp = as.POSIXct(c("2025-02-20 00:00", "2025-02-20 01:00", "2025-02-20 02:00", "2025-02-20 03:00", "2025-02-20 04:00"), format="%Y-%m-%d %H:%M"),
  temperature = c(15, 16, 15.5, 14, 13.5)
)

# Plot temperature over time
ggplot(data, aes(x = timestamp, y = temperature)) +
  geom_line() +
  labs(title = "Temperature Change Over Time", x = "Time", y = "Temperature (°C)") +
  theme_minimal()

# Calculate the rate of change in temperature (difference between consecutive readings)
data$temperature_change = c(NA, diff(data$temperature))

# View the data with temperature change
print(data)

```

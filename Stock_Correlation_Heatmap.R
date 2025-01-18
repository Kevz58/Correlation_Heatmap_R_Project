library(tidyquant)
library(tidyverse)
library(corrplot)

# Define stock tickers of choice
tickers <- c("IREN", "RIVN", "AMZN", "COST", "TD")

# Fetch stock data (last 2 years, but can be adjusted [Year, Month, Day])
stock_data <- tq_get(tickers, from = "2023-12-01", to = "2025-01-01")

# Calculate daily returns
returns_data <- stock_data |>
  
  # Group the data by the 'symbol' column, so operations are performed separately for each stock
  group_by(symbol) |>
  
  # Calculate daily returns using the adjusted price column
  tq_transmute(
    select = adjusted,           # Use the 'adjusted' column as input (e.g., adjusted closing prices)
    mutate_fun = periodReturn,   # Apply the 'periodReturn' function to calculate percentage changes
    period = "daily",            # Specify that returns should be calculated for daily periods
    col_rename = "daily_return"  # Rename the output column to 'daily_return'
  ) |>
  
  # Reshape the data from long to wide format
  pivot_wider(
    names_from = symbol,         # Use unique values in the 'symbol' column as new column names
    values_from = daily_return   # Fill the new columns with the calculated daily returns
  )
# Remove NA rows before correlation calculation
clean_returns <- na.omit(returns_data) 

# Calculate the correlation matrix
cor_matrix <- cor(clean_returns[,-1])  # Exclude the date column

# Create a heatmap
corrplot(cor_matrix, method = "color", 
         type = "upper", 
         addCoef.col = "black", # Add correlation coefficients
         tl.col = "black", 
         tl.srt = 45,          # Rotate labels
         col = colorRampPalette(c("red", "white", "blue"))(200)) # Color gradient


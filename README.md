# Correlation_Heatmap_R_Project

## Overview

This project contains R code and analysis related to stock correlation between multiple stocks, in a changable timeframe and creates a heatmap to visualize the resulting correlation between various stock symbols.

One key factor in portfolio optimization is reducing non-systematic risk through the diversification of assets. Non-systematic risk, also known as company-specific risk, industry-specific risk, or operational risk, is the risk inherent to individual assets. To mitigate this risk, including assets with low or negative correlations can help diversify a portfolio, thereby reducing overall volatility.

By incorporating assets with low or negative correlations, investors can achieve better risk reduction and optimize the performance of their portfolio. When assets move independently or in opposite directions, the overall portfolio becomes less sensitive to individual market fluctuations. This not only lowers the volatility of the portfolio but also enhances its ability to withstand market downturns

Before running the code in this repository, ensure that you have the following software installed:

- **R** 
- **RStudio**

Additionally, install the required R packages by running the following commands in RStudio:

```r
install.packages(c("corrplot", "tidyverse", "tidyquant"))

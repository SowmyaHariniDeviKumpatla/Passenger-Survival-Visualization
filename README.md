# Passenger Survival Visualization

This project analyzes Titanic passenger survival rates using the **Shiny framework in R** and **Python visualization libraries**. The goal is to explore key survival factors using interactive visualizations.

## Features
- Interactive visualizations built with **ggplot2, Plotly, Matplotlib, and Seaborn**.
- Dynamic UI with user-controlled filters.
- Supports multiple plot types: **scatter, histogram, violin, density plots, etc.**
- Data filtering based on **age range, gender, and class**.
- Hosted as a **Shiny web application** (coming soon).

## Dataset
- **Source:** Titanic dataset (`train.csv`)
- **Attributes Considered:** Passenger class, gender, age, fare, survival status, etc.

## How to Run the App
### Option 1: Clone and Run Locally
1. Clone this repository:
   ```sh
   git clone https://github.com/SowmyaHariniDeviKumpatla/Passenger-Survival-Visualization.git
   cd Passenger-Survival-Visualization
2. Install the required R packages:
   ```r
   install.packages(c("shiny", "ggplot2", "plotly", "dplyr"))
4. Run the Shiny app:
   ```r
   runApp("Final Code.R")

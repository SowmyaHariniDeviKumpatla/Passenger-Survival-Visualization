# Data Visualization using Shiny App - Titanic Dataset

## Overview:
This project leverages the Titanic dataset to create an interactive data visualization app using Shiny, R’s web application framework. The goal is to offer a user-friendly interface for users to explore and analyze various demographic and survival trends from the Titanic dataset through multiple types of plots. 

## Features:
- **Interactive Plots**: Users can dynamically generate different plot types such as scatter plots, line plots, bar plots, 3D scatter plots, violin plots, and more.
- **Age Range Filter**: Users can filter the data based on age using a slider to explore age-based trends.
- **Dynamic Plot Selection**: Users can select variables for the x- and y-axes, and choose plot types to generate visualizations of different aspects of the dataset.
- **Color-Coded Analysis**: Some plots, like scatter plots and violin plots, color data points based on passenger sex, highlighting gender-based trends in the dataset.

## Key Plot Types:
- **Scatter Plot**: Visualizes relationships between two variables.
- **Line Plot**: Displays changes over time or across continuous variables.
- **Box Plot & Violin Plot**: Show distribution and spread of data across multiple categories.
- **3D Scatter Plot**: For exploring three variables simultaneously.
- **Density & Histogram Plots**: To observe the distribution of a variable.
- **Jitter Plot**: For displaying the spread of data points.
- **Bubble Plot & Point Plot**: For exploring relationships with an additional variable size (age) and providing a clear overview of data points.

## Technologies Used:
- **R** and **Shiny**: For creating the interactive web application.
- **ggplot2**: For data visualization.
- **Plotly**: To make visualizations interactive.

## Setup:
1. Install R and RStudio.
2. Install the necessary packages:
   ```r
   install.packages(c("shiny", "ggplot2", "plotly", "tidyverse"))


## How to Run the App
### Option 1: Clone and Run Locally
1. Clone this repository:
   ```sh
   git clone https://github.com/SowmyaHariniDeviKumpatla/Passenger-Survival-Visualization.git
   cd Passenger-Survival-Visualization
2. Install the required R packages:
   ```r
   install.packages(c("shiny", "ggplot2", "plotly", "dplyr"))
3. Run the Shiny app:
   ```r
   runApp("Final Code.R")
### Option 2: Run in RStudio
1. Open the Final Code.R script in RStudio.
2. Click the "Run App" button in RStudio to start the Shiny app.
3. Navigate through the interface to select plot types, x- and y-variables, and adjust the age range slider for filtering the dataset.

## Results:
The app provides a comprehensive, real-time, interactive visualization of the Titanic dataset, helping users explore survival trends, demographics, and more.

## Conclusion:
The Shiny app allows users to interact with and explore the Titanic dataset in depth, offering valuable insights into passenger demographics, survival rates, and class disparities. It provides an intuitive and dynamic way to understand complex data relationships.

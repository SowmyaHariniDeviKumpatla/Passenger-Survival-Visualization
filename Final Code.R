# Load necessary libraries
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

# Read data
data <- read.csv("train.csv")

# Define UI
ui <- fluidPage(
  fluidRow(
    column(
      width = 6,
      selectInput(
        "plotType",
        "Select Plot Type:",
        choices = c(
          "Scatter Plot", "Line Plot", "Box Plot", "FreqPoly",
          "Histogram Plot", "Density Plot", "Bar Plot", "Jitter Plot", "Violin Plot",
          "Bubble Plot", "Point Plot"
        ),
        selected = "Scatter Plot"
      )
    )
  ),
  
  selectInput(
    "xVariable",
    "Select x-axis variable:",
    choices = c("Age", "PassengerId", "Pclass", "SibSp", "Parch", "Fare", "None"),
    selected = "Age"
  ),
  
  selectInput(
    "yVariable",
    "Select y-axis variable:",
    choices = c("Age", "PassengerId", "Pclass", "SibSp", "Parch", "Fare"),
    selected = "Fare"
  ),
  
  # Add a slider input for Age
  sliderInput(
    "ageRange", "Select Age Range:",
    min = min(data$Age, na.rm = TRUE), max = max(data$Age, na.rm = TRUE),
    value = c(min(data$Age, na.rm = TRUE), max(data$Age, na.rm = TRUE))
  ),
  
  mainPanel(
    fluidRow(
      column(width = 10, plotlyOutput(outputId = "selectedPlot"))
    )
  )
)

# Define server logic
server <- function(input, output) { 
  output$selectedPlot <- renderPlotly({ 
    plotType <- input$plotType 
    xVariable <- input$xVariable 
    yVariable <- input$yVariable 
    # Filter data based on the selected age range 
    filtered_data <- data %>% 
      filter(Age >= input$ageRange[1], Age <= input$ageRange[2]) 
    p <- switch(
      plotType,
      "Scatter Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, color = "Sex")) + 
          geom_point() + 
          labs(x = xVariable, y = yVariable, title = "Scatter Plot colored by Sex") + 
          theme_minimal()
      },
      "Line Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, color = "Sex")) + 
          geom_line() + 
          labs(x = xVariable, y = yVariable, title = "Line Plot colored by Sex") + 
          theme_minimal()
      },
      "Box Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, color = "Sex")) + 
          geom_boxplot() + 
          labs(x = xVariable, y = yVariable, title = "Box Plot colored by Sex") + 
          theme_minimal()
      },
      "FreqPoly" = {
        ggplot(filtered_data, aes(x = .data[[xVariable]], color = Sex)) + 
          geom_freqpoly(binwidth = 5) + 
          labs(x = xVariable, title = "FreqPoly Plot") + 
          theme_minimal()
      },
      "Histogram Plot" = {
        if ("Sex" %in% colnames(filtered_data)) {
          ggplot(filtered_data, aes_string(x = xVariable, fill = "Sex")) + 
            geom_histogram(binwidth = 10) + 
            labs(x = xVariable, title = paste("Histogram Plot", "colored by Sex")) + 
            theme_minimal()
        } else {
          ggplot(filtered_data, aes_string(x = xVariable)) + 
            geom_histogram(binwidth = 10) + 
            labs(x = xVariable, title = "Histogram Plot") + 
            theme_minimal()
        }
      },
      "Density Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, fill = "Sex")) + 
          geom_density() + 
          labs(x = xVariable, title = "Density Plot") + 
          theme_minimal()
      },
      "Bar Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, fill = "Sex")) + 
          geom_bar(stat = "count") + 
          labs(x = xVariable, title = "Bar Plot") + 
          theme_minimal()
      },
      "Jitter Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, color = "Sex")) + 
          geom_jitter(position = position_jitter(0.2)) + 
          labs(x = xVariable, title = "Jitter Plot") + 
          theme_minimal()
      },
      "Violin Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, fill = "Sex")) + 
          geom_violin() + 
          labs(x = xVariable, title = "Violin Plot") + 
          theme_minimal()
      },
      "Bubble Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, size = "Age", color = "Sex")) + 
          geom_point() + 
          labs(x = xVariable, y = "Age", title = "Bubble Plot") + 
          theme_minimal()
      },
      "Point Plot" = {
        ggplot(filtered_data, aes_string(x = xVariable, y = yVariable, color = "Sex")) + 
          geom_point() + 
          labs(x = xVariable, title = "Point Plot") + 
          theme_minimal()
      }
    )
  }) 
}
# Run the application
shinyApp(ui = ui, server = server)


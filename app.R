# Load required libraries
library(shiny)
library(ggplot2)
library(dplyr)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Exploring Train Dataset"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Select plot type
      selectInput(inputId = "plotType",
                  label = "Select Plot Type",
                  choices = c("Histogram", "Scatterplot"),
                  selected = "Histogram"),
      
      # Select y-axis variable
      selectInput(inputId = "yAxis",
                  label = "Select Y-Axis Variable",
                  choices = c("LotArea", "YearsOld", "OverallQual", "YearBuilt", "SalePrice", "PoolArea", "HouseStyle"),
                  selected = "SalePrice"),
      
      # Select bullet points
      selectInput(inputId = "bulletPoints",
                  label = "Select Bullet Points",
                  choices = c("None", "Full", "Half", "Quarter"),
                  selected = "None")
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Plot
      plotOutput(outputId = "plot")
      
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Render the selected plot
  output$plot <- renderPlot({
    
    # Sample dataset
    train <- read.csv("path/to/your/train.csv")
    
    # Filter dataset based on selected y-axis variable
    plot_data <- train %>% 
      select(input$yAxis) 
    
    # Plot histogram if selected
    if(input$plotType == "Histogram") {
      ggplot(plot_data, aes(x = !!as.symbol(input$yAxis))) + 
        geom_histogram(fill = "blue", color = "black", bins = 30) +
        labs(title = paste("Histogram of", input$yAxis))
    }
    
    # Plot scatterplot if selected
    else if(input$plotType == "Scatterplot") {
      ggplot(train, aes(x = LotArea, y = !!as.symbol(input$yAxis))) + 
        geom_point() +
        labs(title = paste("Scatterplot of Lot Area vs", input$yAxis),
             x = "Lot Area", y = input$yAxis)
    }
    
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)
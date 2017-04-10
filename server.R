library(shiny)

# Download NJ census data from github repository
download.file("https://raw.githubusercontent.com/Mooney721/NJ_Census_shiny_Project/master/NJ_census_data.csv", 
              destfile = "NJ_census_data.csv")
censusData <- read.csv("NJ_census_data.csv")

# Convert Population and Housing Units to numeric values
censusData$Population <- as.numeric(as.factor(censusData$Population))
censusData$Housing.units <- as.numeric(as.factor(censusData$Housing.units))

# Define server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$text <- renderText({
    if (input$Tourism.Region != "All"){
      censusData <- sum(censusData$Population[censusData$Tourism.Region == input$Tourism.Region])
    }
  })
  
})
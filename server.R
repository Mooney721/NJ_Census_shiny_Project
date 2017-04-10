library(shiny)

# Download NJ census data from github repository
download.file("https://raw.githubusercontent.com/Mooney721/NJ_Census_shiny_Project/master/NJ_census_data.csv", 
              destfile = "NJ_census_data.csv")
censusData <- read.csv("NJ_census_data.csv")

# Define server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$plot1 <- renderPlot({
    if (input$Tourism.Region != "None"){
      # Adjust margins to fit diagonal text
      par(mar = c(7, 4, 4, 2) + 0.1)
      
      # Create boxplot of Population vs. Tourism Region with no x axis and no x axis label
      boxplot(censusData$Population[censusData$Tourism.Region == input$Tourism.Region] ~ 
                censusData$Tourism.Region[censusData$Tourism.Region == input$Tourism.Region], 
              ylab = "Population",
              xaxt = "n",
              xlab = "")
      
      # Set no labels for x-axis, then create labels for x-axis
      axis(1, labels = FALSE)
      labels = c("Atlantic City Area", "Delaware River", "Gateway",
                 "Shore", "Skyland", "Southern Shore")
      
      # Put x-axis labels at specific settings and set x-axis as Tourism REgion
      text(1:6, par("usr")[3] - 0.25, srt = 45, adj = 1,
           labels = labels, xpd = TRUE)
      mtext(1, text = "Tourism Region", line = 6)
    }   
  })
  
  # Generate the sum of the Population for the input Tourism Region
  output$text <- renderText({
    if (input$Tourism.Region != "None"){
      censusData <- sum(censusData$Population[censusData$Tourism.Region == input$Tourism.Region])
    }
  })
  
})
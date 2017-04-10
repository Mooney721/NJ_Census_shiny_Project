library(shiny)
library(ggplot2)

# Define server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$plot1 <- renderPlot({
    if (input$cyl != "None"){
      
      # Create boxplot of engine displacement vs. number of cylinders
      # with no x axis and no x axis label
      boxplot(mpg$displ[mpg$cyl == input$cyl] ~ 
                mpg$cyl[mpg$cyl == input$cyl], 
              ylab = "Engine Displacement (L)",
              xlab = "Number of Cylinders",
              main = "Engine Displacement vs. Number of Cylinders")
    }   
  })
  
  # Generate the sum of the Population for the input Tourism Region
  output$text <- renderText({
    if (input$cyl != "None"){
      mpg <- mean(mpg$displ[mpg$cyl == input$cyl])
    }
  })
  
})

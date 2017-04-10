library(shiny)
library(ggplot2)

# UI
shinyUI(fluidPage(
  titlePanel("Engine Displacement, based on Number of cylinders"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cyl", 
                  "Number of Cylinders:", 
                  c("None", 
                    unique(as.character(mpg$cyl))))
    ),
    # Plot a boxplot of the engine displacement by number of cylinders
    # Also, output the average engine displacement for that number of cylinders
    mainPanel(
      plotOutput("plot1"),
      h3("Average Engine Displacement:"),
      textOutput("text"))
  )
)
)
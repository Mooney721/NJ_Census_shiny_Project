library(shiny)

# Define the UI
shinyUI(fluidPage(
  titlePanel("Population of New Jersey, based on Tourism Region"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Tourism.Region", 
                  "Tourism Region:", 
                  c("All", 
                    unique(as.character(censusData$Tourism.Region))))
    ),
    mainPanel(
      h3("Popluation of the Tourism Region:"),
      textOutput("text"))
  )
)
)
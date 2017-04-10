library(shiny)

# Download NJ census data from github repository
download.file("https://raw.githubusercontent.com/Mooney721/NJ_Census_shiny_Project/master/NJ_census_data.csv", 
              destfile = "NJ_census_data.csv")
censusData <- read.csv("NJ_census_data.csv")

# UI
shinyUI(fluidPage(
  titlePanel("Population of New Jersey, based on Tourism Region"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Tourism.Region", 
                  "Tourism Region:", 
                  c("None", 
                    unique(as.character(censusData$Tourism.Region))))
      ),
    # Plot a boxplot of the population by tourism region
    # Also, output the sum of the population for that tourism region
    mainPanel(
      plotOutput("plot1"),
      h3("Popluation of the Tourism Region:"),
      textOutput("text"))
  )
)
)
#install.packages(c("maps", "mapproj", "colorRamps", "shiny"))
#library(maps)
#library(mapproj)
#library(colorRamps)
#library(lubridate)
#library(readxl)
#library(rgdal)
#library(sf)
#library(leaflet)
#library(dplyr)
#library(tidyverse)
#source("/cloud/project/helpers.R")
#counties <- readRDS("/cloud/project/data/counties.rds")

ui <- fluidPage(
  titlePanel("Livability in the US"),
   sidebarLayout(
      sidebarPanel(
        helpText("This is just filler for now."),
        selectInput("var", 
                    label = "Choose a variable to display",
                    choices = list("Number of Parks", 
                                   "Other things",
                                   "Other things1", 
                                   "Other things2"),
                    selected = "Number of Parks")
      ), #sidebarPanel end
      mainPanel(
        textOutput("selected_var"),
        plotOutput("map")
      ) #mainPanel end
  )
)

server <- function(input, output) {
    #percent_map(var = data, color = colorRamps::matlab.like(n = 10), legend.title = input$var, min = input$range[1], max = input$range[2])
}

# Run the app ----
shinyApp(ui = ui, server = server)
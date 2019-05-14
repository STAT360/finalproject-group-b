<<<<<<< HEAD
#install.packages(c("maps", "mapproj", "colorRamps", "shiny", "dplyr", 
                   "leaflet", "rgdal", "sf", "tidyverse", "readr"))
library(maps)
library(mapproj)
library(colorRamps)
library(lubridate)
library(readxl)
library(rgdal)
library(sf)
library(leaflet)
library(dplyr)
library(tidyverse)
library(readr)
source("/cloud/project/helpers.R")
=======
#Run prerun.R before running
>>>>>>> e0c8bedb624ab13d795a7d478aaf8b34ccab5c2c

source("/cloud/project/helpers.R")

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
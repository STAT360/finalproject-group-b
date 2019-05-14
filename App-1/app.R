
source("/cloud/project/helpers.R")

ui <- fluidPage(
  titlePanel("Livability in the US"),
   sidebarLayout(
      sidebarPanel(
        helpText("This is just filler for now."),
<<<<<<< HEAD
        selectInput("var", 
                    label = "Choose a variable to display",
                    choices = list("Select one..."
                                   "Number of Parks", 
                                   "Other things",
                                   "Other things1", 
                                   "Other things2"),
                    selected = "Select one...")
=======
        checkboxGroupInput("var", 
                    label = "Choose a variable to filter by:",
                    choices = list("Unemployment Rate" = 1, 
                                   "Health Insurance Coverage" = 2,
                                   "Median Income" = 3, 
                                   "Crime Rate" = 4),
                    selected = c(1,2,3,4))
>>>>>>> 0dd9bc48498fd929c7d3c63a2e69f8dcd6a3ff70
      ), #sidebarPanel end
      mainPanel(
        textOutput("selected_var"),
        plotOutput("map")
      ) #mainPanel end
  )
)
#rendertable
server <- function(input, output) {
    #percent_map(var = data, color = colorRamps::matlab.like(n = 10), legend.title = input$var, min = input$range[1], max = input$range[2])
}

# Run the app ----
shinyApp(ui = ui, server = server)
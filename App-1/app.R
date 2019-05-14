
source("/cloud/project/helpers.R")

ui <- fluidPage(
  titlePanel("Livability in the US"),
   sidebarLayout(
      sidebarPanel(
        helpText("This is just filler for now."),
        checkboxGroupInput("var", 
                    label = "Choose a variable to filter by:",
                    choices = list("Unemployment Rate", 
                                   "Health Insurance Coverage",
                                   "Median Income", 
                                   "Crime Rate"),
                    selected = c(1,2,3,4))
      ), #sidebarPanel end
      mainPanel(
        textOutput("selected_var"),
        plotOutput("map")
      ) #mainPanel end
  )
)
#rendertable
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "Unemployment Rate" = final_table$`Unemployment Rate`,
                   "Health Insurance Coverage" = final_table$`Total Health Insurance Coverage Uninsured, Percent`
    )
    percent_map(var = data, color = colorRamps::matlab.like(n = 10), legend.title = input$var)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
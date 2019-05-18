source("/cloud/project/helpers.R")

ui <- fluidPage(
  titlePanel("Livability in the US"),
   sidebarLayout(
      sidebarPanel(
        helpText("This is just filler for now."),
        selectInput("var", 
                    label = "Choose a variable to filter by:",
                    choices = list("Unemployment Rate", 
                                   "Health Insurance Coverage",
                                   "Graduation Rate",
                                   "Median Income", 
                                   "Crime Rate"),
                    selected = "Unemployment Rate"),
        selectInput("state",
                    label = "Choose a state to see all data:",
                    choices = final_table$'State',
                    selected = NULL)
      ), #sidebarPanel end
      mainPanel(
        textOutput("selected_var"),
        plotOutput("map"),
        tableOutput("table")
      ) #mainPanel end
  )
)
#rendertable
server <- function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "Unemployment Rate" = final_table$`Rank_Unemployment`,
                   "Health Insurance Coverage" = final_table$`Rank_Health_Insurance_Uninsured`,
                   "Graduation Rate" = final_table$`Graduation_Rate_Rank`,
                   "Median Income" = final_table$`Median_Income_Rank`,
                   "Crime Rate" = final_table$`Violent_Crime_Rate_Per_100000_Rank`
    )
    percent_map(var = data, color = rev(brewer.pal(5,"YlGn")), legend.title = input$var)
  })
  output$table <- renderTable(
                    select(final_table,`State`, `Rank_Unemployment`)
                    )
}

# Run the app ----
shinyApp(ui = ui, server = server)

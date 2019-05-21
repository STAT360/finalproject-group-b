source("/cloud/project/helpers.R")

ui <- fluidPage(
  titlePanel("Livability in the US"),
   sidebarLayout(
      sidebarPanel(
        helpText("Unemployment Rate = % unemployed"),
        helpText("Health Ensurance = % uninsured"),
        helpText("Graduation Rate = % graduated high school"),
        helpText("Median Income = dollars"),
        helpText("Crime Rate = violent crime per 100,000 people"),
        selectInput("var", 
                    label = "Choose a variable to filter by:",
                    choices = list("Unemployment Rate", 
                                   "Health Insurance",
                                   "Graduation Rate",
                                   "Median Income", 
                                   "Crime Rate"),
                    selected = "Unemployment Rate"),
        selectInput("state",
                    label = "Choose a state to see all data:",
                    choices = c("All",final_table$'State'),
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
                   "Unemployment Rate" = final_table$`Unemployment Rate Rank`,
                   "Health Insurance"= final_table$`Health Insurance Rank`,
                   "Graduation Rate" = final_table$`Graduation Rate Rank`,
                   "Median Income" = final_table$`Median Income Rank`,
                   "Crime Rate"  = final_table$`Crime Rate Rank`)
    percent_map(var = data, color = rev(brewer.pal(5,"YlGn")), legend.title = input$var)
  })
  
  output$table <- renderTable({
    if(input$state == "All"){
      final_table %>%
        select(`State`,input$var,paste0(input$var, " Rank")) %>%
        arrange(!!sym(paste0(input$var, " Rank")))
    }else{
      final_table %>%
        select(`State`,input$var,paste0(input$var, " Rank")) %>% 
        filter(`State`==input$state)
    }
  })
}#server

# Run the app ----
shinyApp(ui = ui, server = server)

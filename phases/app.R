library(shiny)
library(ggplot2)

ui <- fluidPage(

    titlePanel("Fatin's Page"),
    h1("Phase Comparison Plot"),
    sliderInput(inputId = "phases",
                label = "Choose Phases to Display",
                min = 1, max = 6, value = 1),
    h3("Phase Time Periods"),
    tableOutput("table"),
    plotOutput("plot")
    
)

server <- function(input, output) {
  
  df <- read.csv("../phases/phasedata.csv")
  
  output$table <- renderTable(
    df[,2:3]
  )
  
  sliderValues <- reactive({
    df[1: input$phases,]
  })
  
  output$plot <- renderPlot({
    g <- ggplot(sliderValues(), aes(x= c2, y= c1))
    g + geom_bar(stat = "sum") + xlab("Phases") + ylab("Mean Value") 
  })
    
}

# Run the application 
shinyApp(ui = ui, server = server)

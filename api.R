library(shiny)

# Define the user interface
ui <- fluidPage(
  titlePanel("Calculator"),
  sidebarLayout(
    sidebarPanel(
      textInput("num1", "Enter Number 1:"),
      textInput("num2", "Enter Number 2:"),
      selectInput("operator", "Select Operator:", choices = c("+", "-", "*", "/")),
      actionButton("calculate", "Calculate"),
      hr(),
      h4("Result:"),
      verbatimTextOutput("result")
    ),
    mainPanel()
  )
)


server <- function(input, output) {
  observeEvent(input$calculate, {
    num1 <- as.numeric(input$num1)
    num2 <- as.numeric(input$num2)
    operator <- input$operator
    
    result <- switch(operator,
                     "+" = num1 + num2,
                     "-" = num1 - num2,
                     "*" = num1 * num2,
                     "/" = num1 / num2)
    
    output$result <- renderPrint({
      result
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)

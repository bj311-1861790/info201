
library("shiny")

ui <- fluidPage(
  titlePanel("Cost Calculator"),
  numericInput("price", label = "Price (in dollars)", value = 0, min = 0),
  numericInput("quantity", label = "Quantity", value = 1, min = 1),
  strong("Cost"),
  textOutput("cost")
)

server <- function(input, output) {
  output$cost <- renderText({
    return(paste0("$", input$price * input$quantity))
  })
}

shinyApp(ui = ui, server = server)
library(shiny)

# Define server logic
function(input, output, session) {
  output$Traduction <- renderText(print("Mot à traduire : "))
  output$Réponse <- renderText(print("La réponse est : "))
  }
  
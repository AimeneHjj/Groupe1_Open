
library(shiny)

fluidPage(
  
  titlePanel("Apprentissage"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "Langue",
        "Langue",
        choices = c(
          "Anglais", "Espagnol", "Allemand",
          "Italien", "Arabe", "Chinois", "Portugais"
        )
      ),
      
      checkboxGroupInput(
        "Sens",
        "Sens de traduction",
        choices = c(
          "Français → Anglais",
          "Anglais → Français"
        )
      ),
      
      checkboxGroupInput(
        "Mode",
        "Mode d'apprentissage",
        choices = c("random", "Renfo")
      ),
      
      selectInput(
        "categorie",
        "Catégorie",
        choices = c(
          "Adverbe", "Animaux", "Meuble",
          "Pronom", "Temps", "Verbe", "Verbe irrégulier"
        )
      )
    ),
    
    mainPanel(
      textOutput("Traduction"),
      textInput(
        "Exo",
        "Traduire le mot : "),
      submitButton("Valider"),
      textOutput("Réponse")
      
    )
  )
)
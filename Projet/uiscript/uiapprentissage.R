dt <- read.csv2("Projet/data/vocabulaire.csv", header = TRUE) #données chargées
fluidPage(
  
  titlePanel("Apprentissage"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "Langue",
        "Langue",
        choices = c(
          unique(dt$Langue)
        )
      ),
      
      checkboxGroupInput(
        "Sens",
        "Sens de traduction",
        choices = c(
          "Thème (Étrangère -> Français)",
          "Version (Français -> étrangère)"
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
        choices = c(unique(dt$Categorie)
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


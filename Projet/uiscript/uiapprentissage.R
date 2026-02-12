dt <- read.csv2("data/vocabulaire.csv", header = TRUE) #données chargées
fluidPage(
  
  titlePanel("Apprentissage"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "Langue",
        "Langue",
        choices = c(
          "TOUT",unique(dt$Langue)
        )
      ),
      
      radioButtons(
        "Sens",
        "Sens de traduction",
        choices = c(
          "Étrangère -> Français",
          "Français -> étrangère"
        )
      ),
      
      radioButtons(
        "Mode",
        "Mode d'apprentissage",
        choices = c("Random", "Renfo")
      ),
      
      selectInput(
        "categorie",
        "Catégorie",
        choices = c("TOUT",unique(dt$Categorie)
        )
      ),
      actionButton(
        "Tirer",
        "Tirer un mot à traduire"
      )
    ),
    
    mainPanel(
      textOutput("Traduction"),
      textInput(
        "Exo",
        "Traduire le mot : "),
      actionButton(
        "Valider",
        "Valider"),
      textOutput("Réponse")
      )
    )
  )


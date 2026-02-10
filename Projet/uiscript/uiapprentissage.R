dt <- read.csv2("data/tabtrad.csv", header = TRUE) #données chargées
fluidPage(
  
  titlePanel("Apprentissage"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "Langue",
        "Langue",
        choices = c(
          unique(dt$Langue), "Espagnol", "Allemand",
          "Italien", "Arabe", "Chinois", "Portugais"
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


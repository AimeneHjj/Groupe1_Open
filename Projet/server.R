library(shiny)

shinyServer(

function(input, output, session){
  
  dt <- read.csv2("data/vocabulaire.csv", header = TRUE)
  
  poids <- reactiveVal(rep(1, nrow(dt)))
  mot_index <- reactiveVal(NULL)
  
  source("serverscript/server_script_apprentissage.R", local = TRUE)
  source("serverscript/server_verif_mot.R", local = TRUE)
  source("serverscript/Server_Ajout.R", local = TRUE)

  observeEvent(input$go_apprentissage,{
    updateTabsetPanel(inputId = "maintab", selected = "Apprentissage")
  })

##################AJOUT#####################
#SI valider taper alors function suivante
#Mot dans text input mot_fr ajouter colonne 1 
#Mot à traduire dans text input mot_et ajouter colonne 2 
#SI "" dans input selectInput"langue" alors mot dans text input nouvelle_langue colonne 3.
#Sinon mettre selectInput"langue" dans la colonne 3
#SI " " dans input selectInput"catégorie_existante" alors mot dans text input nouvelle_categorie colonne 4.
#Sinon mettre selectInput"catégorie_existante" dans la colonne 4

  #source("le nom de votre fichier")


# Define server logic
#function(input, output) {
#output$Traduction <- renderText(print("Mot à traduire : "))
#output$Réponse <- renderText(print("La réponse est : "))

})


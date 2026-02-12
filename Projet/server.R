library(shiny)

function(output, input, session){
  
  observeEvent(input$go_apprentissage, {
    showNotification("Bouton cliqué !", type = "message")
    updateTabsetPanel(session = session, inputId = "maintab", selected = "Apprentissage")
  })

###################AFFICHER LE MOT#############################
#Select by langue
#Si étranger vers francais alors colonne "mot" Sinon colonne "Traduction"
#Select by catégorie
#Si random est coché alors -> tirage aléatoire de la ligne Sinon tirage renfo 
#print le mot choisi dans output$Traduction 
#Mettre dasn un objet le mot tiré
  observeEvent(input$Valider, {

  #source("le nom de votre fichier")
  


##################VÉRIFICATION################################

#SI valider taper alors function suivante
#Récuperer le mot écris par l'utilisateur dans TEXT$INPUT nom : exo
#Récuperer coordonnées du mot tirer qui est stocké dans un objet
#SI étranger vers francais alors -1 sur la colone sinon +1
#Récupuere mot de la case 
#SI exo == Mot de la case alors output$Réponse <- renderText(print("La réponse est : JUSTE ")  
#SINON output$Réponse <- renderText(print("La réponse est : Fausse, la bonne réponse est", mot de la case)
  source("serverscript/server_verif_mot.R")

##################Score#####################


##################AJOUT#####################
#SI valider taper alors function suivante
#Mot dans text input mot_fr ajouter colonne 1 
#Mot à traduire dans text input mot_et ajouter colonne 2 
#SI "" dans input selectInput"langue" alors mot dans text input nouvelle_langue colonne 3.
#Sinon mettre selectInput"langue" dans la colonne 3
#SI " " dans input selectInput"catégorie_existante" alors mot dans text input nouvelle_categorie colonne 4.
#Sinon mettre selectInput"catégorie_existante" dans la colonne 4

  #source("le nom de votre fichier")
})

# Define server logic
#function(input, output) {
#output$Traduction <- renderText(print("Mot à traduire : "))
# output$Réponse <- renderText(print("La réponse est : "))

}



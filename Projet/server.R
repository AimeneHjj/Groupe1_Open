library(shiny)
shinyServer(
function(input, output, session){

  library(shiny)
  
  data_filtre<-reactive({
    #filtre le tableau par langue choisi
    if (input$Langue == "TOUT"){
      dt_filtre<-dt 
    }
    else {
      dt_filtre<-dt[dt$Langue == input$Langue,]}
    #sélectionne la colonne mot ou traduction du tableau ddéjà filtrer
    if(input$Sens == "Étrangère -> Français"){
      dt_reduit<-dt_filtre[,c("Traduction","Categorie")]}
    else {
      dt_reduit<-dt_filtre[,c("Mot","Categorie")]}
    #Sélectionne dans le tableau réduit les mots appartenant à la bonne catégorie
    if (input$categorie=="TOUT"){
      dt_final<-dt_reduit}
    else {
      dt_final<-dt_reduit[dt_reduit$Categorie == input$categorie,]
    }
  })
  #Tirage d'un mot aléatoire
  mot<-eventReactive(input$Tirer,{
    df<- data_filtre()
    if (nrow(df) == 0) return(NULL)
    if (input$Mode == "Random"){
      ligne<- df[sample(nrow(df),1),]}
    else {
      ligne<- df[sample(nrow(df),1),]
    }
    return(ligne)
  })
  output$Traduction <- renderText(paste("Mot à traduire :", mot()[[1]]))

  dt <- read.csv2("data/vocabulaire.csv", header = TRUE)
  
  s <- reactiveValues(score = 0, meilleur_score = 0)
  
  answer<-eventReactive(input$Valider,{
    if(input$Sens == "Étrangère -> Français"){
      rawans <- which(dt$Traduction == mot()[[1]])[1]
      answ <- as.character(dt[rawans, 1])
    }else{ 
      rawans <- which(dt$Mot == output$Traduction)[1]
      answ <- as.character(dt[rawans, 2])
    }})
    output$Réponse <- renderText({
      if(answer() == input$Exo){
        output$Réponse <- renderText(paste0(("Juste")))
        s$score <- s$score + 1
        if (s$score >= s$meilleur_score){
          s$meilleur_score <- s$score    
        } } 
      else{
        output$Réponse <- renderText(paste0(("Faux, la réponse était : "), paste0(answer())))
        s$score <- 0
      }
    }
    )
  
  output$meilleur_score_ui <- renderText({
    paste0("Meilleur score : ", s$meilleur_score) #Affichage sur meilleur score
  })
  
  output$score_ui <- renderText({
    paste0("Score : ", s$score) # Affichage du score 
  })
  
  
  
  

###################AFFICHER LE MOT#############################
#Select by langue
#Si étranger vers francais alors colonne mot Sinon colonne Traduction
#Select by catégorie
#Si random est coché alors -> tirage aléatoire de la ligne Sinon tirage renfo 
#print le mot choisi dans output$Traduction 
#Mettre dasn un objet le mot tiré

 
  


##################VÉRIFICATION################################

#SI valider taper alors function suivante
#Récuperer le mot écris par l'utilisateur dans TEXT$INPUT nom : exo
#Récuperer coordonnées du mot tirer qui est stocké dans un objet
#SI étranger vers francais alors -1 sur la colone sinon +1
#Récupuere mot de la case 
#SI exo == Mot de la case alors output$Réponse <- renderText(print("La réponse est : JUSTE ")  
#SINON output$Réponse <- renderText(print("La réponse est : Fausse, la bonne réponse est", mot de la case)
#source("serverscript/server_verif_mot.R")

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
#output$Réponse <- renderText(print("La réponse est : "))




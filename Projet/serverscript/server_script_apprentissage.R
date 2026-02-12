library(shiny)

function(input, output, session) {
  
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
}
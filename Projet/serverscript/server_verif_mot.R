#louis
dt <- read.csv2("data/vocabulaire.csv", header = TRUE)
sens <- input$Sens
mot_uti <- input$Exo
mot_trad <- output$Traduction
if(sens == "Thème (Étrangère -> Français)"){
  rawans <- which(dt$Traduction == mot_uti)[1]
  answ <- dt[rawans, 1]
}else{ 
  rawans <- which(dt$Mot == mot_uti)[1]
  answ <- dt[rawans, 2]
}
output$Réponse <- renderText({
  if(answ == mot_trad){
    output$Réponse <- renderText(cat(green("La réponse est Juste")))
  } else{
    output$Réponse <- renderText(cat(red("La réponse est Juste")))
  }
                                 
})
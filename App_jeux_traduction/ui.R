library(shiny)

fluidPage(
  h3("Ajouter un mot"), #affiche le titre
  textInput("mot_fr", "Mot"), #zone d'écriture du mot en français
  textInput("mot_et", "Mot a traduire"),# zone d'écriture du mot traduit
  textInput("nouvelle_categorie", "Nouvelle catégorie"), # zone d'écriture de la catégorie
  selectInput("categorie_existante", "Catégorie",
              choices = c("Animaux", "Verbes", "Objets")),# liste déroulante catégorie
  textInput("nouvelle_langue", "Nouvelle langue"),#zone d'écriture de la langue 
  selectInput("langue", "Langue",
              choices = c("Anglais")),# liste déroulante de la langue 
  actionButton("Valider_mot", "Valider") # bonton pour valider
library(shiny)

# Define UI for application
fluidPage(
  
  # Application title
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  sidebarLayout(
    tabsetPanel(
      tabPanel("Présentation",
               "Contenu de l'onglet Présentation")
      tabPanel("Apprentissage",
               "Contenu de l'onglet Apprentissage")
      tabPanel("Paramétrage",
               "Contenu de l'onglet Paramétrage")
      tabPanel("Crédits","Contenu de l'onglet Crédits")
    )
  )
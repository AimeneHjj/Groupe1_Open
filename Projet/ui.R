library(shiny)
shinyUI(
fluidPage(
  
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  tabsetPanel( id="maintab",
    tabPanel("Présentation",
             source("uiscript/uipresentation.R")),
    
    tabPanel("Apprentissage", source("uiscript/uiapprentissage.R")),
    
    tabPanel("Paramétrage", source("uiscript/uiparamétrage.R")),
    
    tabPanel("Crédits",
             source("uiscript/uicredit.R"))
  )
)
)
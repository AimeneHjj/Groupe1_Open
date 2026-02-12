library(shiny)
shinyUI(
fluidPage(
  
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  tabsetPanel( id="maintab",
    tabPanel("Présentation",
             source("uiscript/uipresentation.R")),
    
    tabPanel("Apprentissage", source("uiscript/uiapprentissage.R"), local=TRUE),
    
    tabPanel("Paramétrage", source("uiscript/uiparamétrage.R"), local=TRUE),
    
    tabPanel("Crédits",
             source("uiscript/uicredit.R"))
  )
)
)
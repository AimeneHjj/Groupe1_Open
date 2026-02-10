library(shiny)

dt <- read.csv2("data/tabtrad.csv", header = TRUE)

# Define UI for application
fluidPage(
  
  # Application title
  titlePanel("Application de Traduction"),
  
  # Création des 4 onglets
  tabsetPanel(
    tabPanel("Présentation",
             source("uiscript/uipresentation.R")),
    
    tabPanel("Apprentissage", source("uiscript/uiapprentissage.R")),
    
    tabPanel("Paramétrage", source("uiscript/uiparamétrage.R")),
    
    tabPanel("Crédits",
             source("uiscript/uicredit.R"))
  )
)
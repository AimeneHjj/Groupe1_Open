library(shiny)

# 1. L'INTERFACE AVEC DESIGN ET DRAPEAUX 
fluidPage(
  tags$head(
    tags$style(HTML("
      body { 
        background: linear-gradient(135deg, #ffffff 0%, #eef2f3 100%); 
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
      }
      .title-header {
        background-color: #2c3e50;
        color: white;
        padding: 20px;
        text-align: center;
        border-radius: 0 0 15px 15px;
        margin-bottom: 25px;
      }
      .mission-card {
        background-color: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        border-top: 5px solid #27ae60;
      }
      /* Style pour aligner les drapeaux */
      .flag-container {
        text-align: center;
        margin-bottom: 20px;
      }
      .flag-icon {
        width: 60px;
        margin: 0 15px;
        transition: transform 0.3s;
      }
      .flag-icon:hover {
        transform: scale(1.2);
      }
      .team-well {
        background-color: #f8fbff;
        border-left: 5px solid #27ae60;
        padding: 20px;
        border-radius: 5px;
      }
    "))
  ),
  
  div(class = "title-header", h1("Polyglot Explorer")),
  
  tabsetPanel(
    tabPanel("🌟 Notre Mission",
             fluidRow(
               column(10, offset = 1,
                      br(),
                      div(class = "mission-card",
                          
                          # --- SECTION DRAPEAUX ---
                          div(class = "flag-container",
                              img(src = "https://cdn-icons-png.flaticon.com/512/197/197374.png", class = "flag-icon"), # UK
                              img(src = "https://cdn-icons-png.flaticon.com/512/197/197560.png", class = "flag-icon"), # France
                              img(src = "https://cdn-icons-png.flaticon.com/512/197/197593.png", class = "flag-icon"), # Espagne
                              img(src = "https://cdn-icons-png.flaticon.com/512/197/197587.png", class = "flag-icon"), # Allemagne
                              img(src = "https://cdn-icons-png.flaticon.com/512/197/197599.png", class = "flag-icon")  # Italie
                          ),
                          
                          h2("Ouvrez vos horizons linguistiques", style = "text-align: center; color: #27ae60;"),
                          br(),
                          
                          p("Apprendre une nouvelle langue est une aventure. Pour vous accompagner, nous avons conçu cet outil interactif 
                        qui permet d'analyser et de visualiser la structure de votre vocabulaire.", 
                            style = "font-size: 1.2em; text-align: center;"),
                          
                          hr(),
                          
                          h3("Pourquoi cette application ?", style = "color: #2c3e50;"),
                          p("Que vous révisiez pour un examen ou que vous prépariez un voyage, notre outil transforme vos listes de mots 
                        en données visuelles claires pour optimiser vos révisions."),
                          
                          br()
                      ), style = "text-align: right;",
                      actionButton(
                        "go_apprentissage",
                        "Apprentissage")
               )
               
             )
    )
  )
)

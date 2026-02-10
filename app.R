library(shiny)

# 1. L'INTERFACE (Design Premium)
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      /* Fond dégradé plus riche et profond */
      body { 
        background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); 
        min-height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #2c3e50;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      
      /* Carte centrale ultra-propre */
      .mission-card {
        background-color: rgba(255, 255, 255, 0.95);
        padding: 50px;
        border-radius: 30px;
        box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        max-width: 900px;
        margin: 40px auto;
        border: 1px solid rgba(255,255,255,0.2);
      }
      
      /* Alignement des drapeaux */
      .flag-container { 
        text-align: center; 
        margin-bottom: 35px; 
      }
      .flag-icon { 
        width: 80px; 
        margin: 0 12px; 
        border-radius: 50%; 
        box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        border: 3px solid white;
        transition: transform 0.3s ease;
      }
      .flag-icon:hover { transform: translateY(-10px); }
      
      h2 { 
        color: #1e3c72; 
        font-weight: 800; 
        text-align: center; 
        text-transform: uppercase;
        letter-spacing: 1px;
      }
      
      .separator {
        height: 4px;
        width: 100px;
        background: #27ae60;
        margin: 20px auto;
        border-radius: 2px;
      }

      /* Boite Équipe stylisée */
      .team-box { 
        background-color: #f1f4f8; 
        padding: 25px; 
        border-radius: 15px; 
        border: 1px dashed #2a5298;
      }
      
      .team-title {
        color: #2a5298;
        font-weight: bold;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
      }
    "))
  ),
  
  div(class = "mission-card",
      
      # SECTION DRAPEAUX (UK, France, Espagne, Allemagne, Italie)
      div(class = "flag-container",
          img(src = "https://cdn-icons-png.flaticon.com/512/197/197374.png", class = "flag-icon"), # UK
          img(src = "https://cdn-icons-png.flaticon.com/512/197/197560.png", class = "flag-icon"), # France
          img(src = "https://cdn-icons-png.flaticon.com/512/197/197593.png", class = "flag-icon"), # Espagne
          img(src = "https://cdn-icons-png.flaticon.com/512/197/197587.png", class = "flag-icon"), # Allemagne
          img(src = "https://cdn-icons-png.flaticon.com/512/197/197626.png", class = "flag-icon")  # Italie
      ),
      
      h2("Ouvrez vos horizons linguistiques"),
      div(class = "separator"),
      
      p("L'apprentissage d'une langue est la clé d'un nouveau monde. Nous avons créé cet outil pour transformer vos révisions en une expérience visuelle et simplifiée.", 
        style = "font-size: 1.3em; text-align: center; line-height: 1.6;"),
      
      br(),
      
      div(class = "team-box",
          div(class = "team-title", "🚀 NOTRE ÉQUIPE DE CRÉATEURS"),
          fluidRow(
            column(6, tags$ul(style="list-style:none; padding:0;",
                              tags$li(span(style="color:#27ae60;","✔"), strong(" Louis ROMERO")),
                              tags$li(span(style="color:#27ae60;","✔"), strong(" Aïmène HEJJAJ"))
            )),
            column(6, tags$ul(style="list-style:none; padding:0;",
                              tags$li(span(style="color:#27ae60;","✔"), strong(" Amir VELLUT")),
                              tags$li(span(style="color:#27ae60;","✔"), strong(" Brayane SIMO"))
            ))
          )
      ),
      
      br(),
      p(em("« Chaque langue vous fait vivre une nouvelle vie. »"), 
        style = "text-align: center; color: #7f8c8d; border-top: 1px solid #eee; padding-top: 20px;")
  )
)

# 2. LE SERVEUR
server <- function(input, output) {}

# 3. LANCEMENT
shinyApp(ui = ui, server = server)
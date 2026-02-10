library(shiny)

# 1. L'INTERFACE
ui <- fluidPage(
  titlePanel("Explorateur de Vocabulaire Interactif"),
  
  tabsetPanel(
    # PREMIER ONGLET : L'outil technique
    tabPanel("Analyse Visuelle", 
             sidebarLayout(
               sidebarPanel(
                 h4("Paramètres"),
                 sliderInput("bins", "Niveau de détail :", 1, 30, 10),
                 hr(),
                 p("Développé par Brayane SIMO", style = "font-style: italic;")
               ),
               mainPanel(
                 plotOutput("graphiqueMots"),
                 tableOutput("tableauApercu")
               )
             )
    ),
    
    # DEUXIÈME ONGLET : La Description (SANS GRAPHIQUE)
    tabPanel("Notre Mission",
             fluidRow(
               column(10, offset = 1,
                      br(),
                      h2("Ouvrez vos horizons linguistiques", style = "color: #2c3e50; text-align: center;"),
                      br(),
                      
                      # Texte de précision
                      p("Apprendre une nouvelle langue est une aventure. Pour vous accompagner, nous avons conçu cet outil interactif 
                      qui permet d'analyser et de visualiser la structure de votre vocabulaire.", 
                        style = "font-size: 1.2em; text-align: justify; color: #34495e;"),
                      
                      h3("Pourquoi cette application ?", style = "color: #2980b9; border-bottom: 1px solid #eee; padding-bottom: 10px;"),
                      p("Que vous révisiez pour un examen ou que vous prépariez un voyage, la mémorisation passe par la compréhension 
                      de la fréquence et de la répétition. Notre outil transforme vos listes de mots (fichiers CSV) en données 
                      visuelles claires pour optimiser vos révisions."),
                      
                      br(),
                      
                      # Section Équipe
                      wellPanel(
                        h4("L'Équipe de Création", style = "margin-top: 0; color: #2c3e50;"),
                        p("Quatre passionnés de langues et de technologie unis pour faciliter votre apprentissage :"),
                        tags$ul(
                          tags$li(strong("Louis ROMERO")),
                          tags$li(strong("Aïmène HEJJAJ")),
                          tags$li(strong("Amir VELLUT")),
                          tags$li(strong("Brayane SIMO"))
                        )
                      ),
                      
                      br(),
                      p(em("« La langue est la feuille de route d'une culture. Elle vous dit d'où viennent les gens et où ils vont. »"), 
                        style = "text-align: center; color: #95a5a6; border-top: 1px solid #eee; padding-top: 20px;")
               )
             )
    )
  )
)

# 2. LE SERVEUR
server <- function(input, output) {
  # Lecture du fichier CSV (Assure-toi que le fichier est dans le dossier)
  data_mots <- read.csv("Tableau mots.csv", sep = ";", encoding = "UTF-8")
  
  output$tableauApercu <- renderTable({ head(data_mots, 10) })
  
  output$graphiqueMots <- renderPlot({
    longueurs <- nchar(as.character(data_mots[,1])) 
    hist(longueurs, breaks = input$bins, col = "steelblue", border = "white",
         main = "Analyse de la structure des mots", xlab = "Nombre de lettres", ylab = "Fréquence")
  })
}

# 3. LANCEMENT
shinyApp(ui = ui, server = server)

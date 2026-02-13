fluidRow(
  column(10, offset = 1,
         br(),
         
         # Description générale
         p("Merci d'avoir utilisé notre application. 
         
         Celle-ci a été codé grace a Shiny qui est un framework R
         développé par RStudio qui permet de créer des applications web
           interactives directement depuis R.", 
           style = "text-align: justify; font-size: 16px;"),
         br(),
         
         # Section Équipe
         wellPanel(
           h4("L'Équipe de Création", style = "margin-top: 0; color: #2c3e50;"),
           p("Quatre étudiant en ingénieurie a l'ISARA unis pour faciliter votre apprentissage :"),
           tags$ul(
             tags$li(strong("Louis ROMERO")),
             tags$li(strong("Aïmène HEJJAJ")),
             tags$li(strong("Amir VELLUT")),
             tags$li(strong("Brayane SIMO"))
           )
         )
  )
)
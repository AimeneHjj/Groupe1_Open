fluidRow(
  column(10, offset = 1,
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
         
  )
)
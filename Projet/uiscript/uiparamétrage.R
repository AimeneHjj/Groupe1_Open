dt <- read.csv2("data/vocabulaire.csv", header = TRUE)#données chargées
sidebarLayout(
             sidebarPanel(
               selectInput("categorie_existante", "Catégorie",
                           choices = c("", unique(dt$Categorie))),# liste déroulante catégorie
               textInput("nouvelle_categorie", "Nouvelle catégorie"), # zone d'écriture de la catégorie
               selectInput("langue", "Langue",
                           choices = c(unique(dt$Langue)), selected = "Anglais"),# liste déroulante de la langue 
               textInput("nouvelle_langue", "Nouvelle langue"),#zone d'écriture de la langue
               
             ),
             mainPanel(
               h3("Ajouter un mot"), #affiche le titre
               textInput("mot_fr", "Mot"), #zone d'écriture du mot en français
               textInput("mot_et", "Mot a traduire"),# zone d'écriture du mot traduit
               actionButton("Valider_mot", "Valider") # bonton pour valider
               ))



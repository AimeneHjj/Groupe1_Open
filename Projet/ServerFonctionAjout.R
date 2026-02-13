# Appeler le fichier avec la fonction d'ajout de mot
source("ServerFonctionAjout.R", local = TRUE)

# Charger la base de données
vocabulaire <- reactiveVal(read.csv2("data/vocabulaire.csv", encoding = "UTF-8", stringsAsFactors = FALSE))

# Fonction d'ajout de mot
observeEvent(input$Valider_mot, {
  
  # Vérifier que les champs obligatoires sont remplis
  req(input$mot_fr, input$mot_et)
  
  mot_francais <- input$mot_fr
  mot_traduit <- input$mot_et
  
  # Déterminer la langue
  if (!is.null(input$nouvelle_langue) && input$nouvelle_langue != "") {
    langue <- input$nouvelle_langue
  } else {
    langue <- input$langue
  }
  
  # Déterminer la catégorie
  if (!is.null(input$nouvelle_categorie) && input$nouvelle_categorie != "") {
    categorie <- input$nouvelle_categorie
  } else {
    categorie <- input$categorie_existante
  }
  
  # Vérifier que langue et catégorie sont remplis
  if (is.null(langue) || langue == "" || is.null(categorie) || categorie == "") {
    showNotification("Veuillez sélectionner une langue et une catégorie !", type = "error")
    return()
  }
  
  # Récupérer les données actuelles
  donnees_actuelles <- vocabulaire()
  
  # Créer la nouvelle ligne
  nouvelle_ligne <- data.frame(
    Mot = mot_francais,
    Traduction = mot_traduit,
    Langue = langue,
    Categorie = categorie,
    stringsAsFactors = FALSE
  )
  
  # Ajouter à la base de données
  donnees_mises_a_jour <- rbind(donnees_actuelles, nouvelle_ligne)
  vocabulaire(donnees_mises_a_jour)
  
  # Sauvegarder dans le fichier CSV (version simplifiée)
  write.csv2(donnees_mises_a_jour, "data/vocabulaire.csv", 
             row.names = FALSE, fileEncoding = "UTF-8")
  
  # Réinitialiser les champs
  updateTextInput(session, "mot_fr", value = "")
  updateTextInput(session, "mot_et", value = "")
  updateTextInput(session, "nouvelle_categorie", value = "")
  updateTextInput(session, "nouvelle_langue", value = "")
  
  # Message de confirmation
  showNotification("Mot ajouté avec succès !", type = "message", duration = 3)
  
})

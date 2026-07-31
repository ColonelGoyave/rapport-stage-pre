#let project(
  title: "",
  subtitle: "",
  author: "",
  promotion: "",
  tuteur-ensta: "",
  tuteur-entreprise: "",
  organisme: "",
  adresse-organisme: "",
  dates-stage: "",
  specialite: "",
  annee-scolaire: "",
  confidentialite: "non-confidentiel", // "confidentiel", "non-confidentiel", ou "non-confidentiel-sur-place"
  logo-ensta: none,
  logo-organisme: none,
  body
) = {
// Configuration de la page
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2cm),
    
    // EN-TÊTE DYNAMIQUE (à partir de la page 2)
    header: context {
      let page-num = counter(page).get().first()
      if page-num >= 2 {
        if calc.even(page-num) {
          // Page paire : Titre du rapport
          align(center, text(9pt, style: "italic", title))
        } else {
          // Page impaire : Titre du chapitre / partie courant(e)
          let current-headings = query(
            selector(heading.where(level: 1)).before(here())
          )
          if current-headings.len() > 0 {
            let last-heading = current-headings.last()
            align(center, text(9pt, style: "italic", last-heading.body))
          }
        }
        v(-0.5em)
        line(length: 100%, stroke: 0.5pt + gray)
      }
    },
    
    // PIED DE PAGE DYNAMIQUE (à partir de la page 2)
    footer: context {
      let page-num = counter(page).get().first()
      if page-num >= 1 {
        align(center)[
          #text(9pt)[#author / #organisme] \
          #text(9pt, fill: red, weight: "bold")[
            #if confidentialite == "confidentiel" [
              Rapport confidentiel
            ] else if confidentialite == "non-confidentiel-sur-place" [
              Rapport non confidentiel et non publiable sur internet
            ] else [
              Rapport non confidentiel
            ]
          ] \
          #v(0.3em)
          #text(10pt, str(page-num))
        ]
      }
    }
  )

  // Configuration du texte (interligne simple, justification)
  set text(font: "Liberation Serif", size: 12pt, lang: "en")
  set par(justify: true, first-line-indent: 1.5cm, leading: 0.8em)

  // Style des titres
  show heading.where(level: 1): it => block(width: 100%, below: 2em)[
    #set text(size: 22pt, weight: "bold")
    #it.body
  ]
  show heading.where(level: 2): it => block(below: 1.5em)[
    #set text(size: 14pt, weight: "bold")
    #it.body
  ]
  show heading.where(level: 3): it => block(below: 1em)[
    #set text(size: 12pt, weight: "bold-italic")
    #it.body
  ]

  // --- PAGE DE TITRE / PREMIÈRE DE COUVERTURE ---
  page(header: none, footer: none)[
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      if logo-ensta != none { logo-ensta } else { [Logo ENSTA] },
      if logo-organisme != none { logo-organisme } else { [Logo Organisme] }
    )

    #v(1cm)

    #align(center)[
      #text(14pt, weight: "bold")[Projet de Recherche (PRe)] \
      #v(0.5cm)
      #text(12pt)[Spécialité : #specialite] \
      #text(12pt)[Année scolaire : #annee-scolaire]
      #v(1cm)
      #text(20pt, weight: "bold")[#title] \
      #if subtitle != "" [
        #v(0.5cm)
        #text(14pt, style: "italic")[#subtitle]
      ]
    ]

    #v(1cm)
    #align(center)[
    #image("assets/image_couverture.png", width: 25%)
    ]
    #v(1cm)

        // Mention de confidentialité sur la page de titre (en rouge)
    #align(center)[
      #text(fill: red, weight: "bold")[
        #if confidentialite == "confidentiel" [
          RAPPORT CONFIDENTIEL
        ] else if confidentialite == "non-confidentiel-sur-place" [
          RAPPORT NON CONFIDENTIEL - CONSULTABLE SUR PLACE UNIQUEMENT
        ] else [
          RAPPORT NON CONFIDENTIEL
        ]
      ]
    ]

    #v(1cm)

    #grid(
      columns: (1fr, 1fr),
      row-gutter: 1.2em,
      [Auteur : #author], [Promotion : #promotion],
      [Tuteur ENSTA : #tuteur-ensta], [Tuteur HITS : #tuteur-entreprise])
      #v(1cm)
    #align(center)[
      Stage effectué du #dates-stage\
      #v(0.5cm)
      Nom de l'organisme d'accueil : #organisme\
      Adresse : #adresse-organisme\
    ]

  ]

  // --- PAGE DE GARDE VIERGE ---
  page(header: none, footer: none)[]

  // Corps du document
  body
}
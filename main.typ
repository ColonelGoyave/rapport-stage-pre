#import "config.typ": project

#show: project.with(
  title: "Flammes de déflagrations thermonucléaires dans les supernovae de type Ia",
  subtitle: "Etude multiparamétrique 1D sur le programme Phlegethon",
  author: "Alexis SPAETH--LEMARCHAND",
  promotion: "2027",
  specialite: "Astrophysique / Physique théorique",
  annee-scolaire: "2025-2026",
  tuteur-ensta: "Jean BOISSON",
  tuteur-entreprise: "Prof. Dr. Friedrich K. RÖPKE",
  organisme: "Heidelberg Institute for Theoretical Studies (HITS)",
  adresse-organisme: "Schloss-Wolfsbrunnenweg 35, 69118 Heidelberg, Allemagne",
  dates-stage: "25/05/2026 au 16/08/2026",
  confidentialite: "non-confidentiel", // Choisir parmi: "confidentiel", "non-confidentiel", "non-confidentiel-sur-place"
  logo-ensta: image("assets/logo_ensta.png", width: 4cm),
  logo-organisme: image("assets/logo_hits.png", width: 4cm),
)

// --- FRONTMATTER ---

// Note de confidentialité
#include "frontmatter/confidentialite.typ"

// Remerciements
#include "frontmatter/remerciements.typ"

// Résumé / Abstract + Mots-clés (10 lignes chacun environ)
#page[
  == Résumé
  #lorem(80) // Remplacer par votre texte de résumé

  *Mots-clés :* Astrophysique, Exoplanètes, Spectroscopie, Traitement de signal.

  #v(2em)

  == Abstract
  #lorem(80) // Remplacer par votre résumé en anglais

  *Keywords:* Astrophysics, Exoplanets, Spectroscopy, Signal Processing.
]

// Tables
#outline(title: [Table des matières], indent: auto)
#pagebreak()

#outline(title: [Table des figures], target: figure.where(kind: image))
#outline(title: [Table des tableaux], target: figure.where(kind: table))
#pagebreak()


// --- CHAPITRES PRINCIPAUX ---

#include "chapitres/introduction.typ"
#pagebreak()

#include "chapitres/description-travail.typ"
#pagebreak()

// Section Contribution (regroupant les fichiers de votre sous-dossier)
= Contribution et Travaux Réalisés

#include "chapitres/contribution/introduction.typ"
#include "chapitres/contribution/methodologie.typ"
#include "chapitres/contribution/resultats.typ"
#include "chapitres/contribution/discussion.typ"

// Le planning de stage doit se trouver à la fin du développement
#include "chapitres/contribution/planning.typ"
#include "chapitres/contribution/conclusion.typ"
#pagebreak()

#include "chapitres/conclusion.typ"
#pagebreak()


// --- BACKMATTER ---

// Bibliographie
#bibliography("references.bib", title: [Bibliographie], style: "ieee")
#pagebreak()

// Glossaire
#include "backmatter/glossaire.typ"
#pagebreak()

// Index (optionnel)
#include "backmatter/index.typ"
#pagebreak()

// Annexes
#include "backmatter/annexes.typ"
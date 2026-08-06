#import "config.typ": project

#import "@preview/glossarium:0.5.0": make-glossary, register-glossary

#import "backmatter/glossaire.typ": setup-glossary-refs
#import "backmatter/glossaire.typ": gls, glsf, glsl, Gls, Glsf, Glsl

// Active la prise en charge des @clé dans tout le document
#show: setup-glossary-refs

// Active la prise en charge des @clé pour le glossaire
#show: setup-glossary-refs

// ... reste de ton main.typ

// 1. Activer le modèle glossarium sur tout le document
#show: make-glossary


// ... reste de ton main.typ (titre, TOC, etc.)


#show: project.with(
  title: "Thermonuclear deflagration flames\nin type Ia supernovaes",
  subtitle: "A 1D multiparametric study on the Phlegethon program",
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
#v(2fr)
  == Abstract
  Type Ia supernovae, originating from the explosion of a #glsf("wd") in a binary system, are standard candles used to measure cosmological distances and study dark energy. Understanding the physics of their explosion requires precise modeling of #glsf("deflagration") flames. This work presents a multiparametric study of these flame speeds using the stellar hydrodynamics code Phlegethon @leidi2026. By extending existing models @timmes1992 @schwab2020, we established a new formulation for the #glsf("flame_speed") that accounts for the ambient density, chemical composition, and electron fraction of the medium. This extension enables the study of deflagration flame speeds in stellar structures that evolve both spatially and temporally.

  *Keywords:* Astrophysics, #Glsl("snia"), #Glsl("deflagration"), #Glsl("flame_speed"), #Glsl("network"), #Glsl("wd"), Phlegethon.

  #v(1fr)

  == Résumé

  Les supernovae de type Ia, issues de l'explosion d'une naine blanche en système binaire, sont des _chandelles standard_ utilisées pour la mesure des distances cosmologiques et l'étude de l'énergie noire. Comprendre la physique de leur explosion nécessite une modélisation précise des flammes de déflagration thermonucléaire. Ce travail présente une étude multiparamétrique de la vitesse de ces flammes à l'aide du code d'hydrodynamique stellaire Phlegethon @leidi2026. En étendant les modèles existants @timmes1992 @schwab2020, nous avons établi une nouvelle formulation de la vitesse de flamme laminaire en prenant en compte la densité, la composition chimique et la fraction électronique du milieu. Cette extension permet d'étudier la vitesse de déflagration de structures stellaires évolutives spatialement et temporellement.

  *Mots-clés :* Astrophysique, Supernovae de type Ia, Déflagration thermonucléaire, Vitesse de flamme, Réseau thermonucléaire, Naine blanche, Phlegethon.
#v(2fr)
]

// Tables
#outline(title: [Table of content], indent: auto)
#pagebreak()

#outline(title: [List of figures], target: figure.where(kind: image))
#outline(title: [List of tables], target: figure.where(kind: table))
#pagebreak()


// --- CHAPITRES PRINCIPAUX ---

#include "chapitres/01-introduction.typ"
#pagebreak()

#include "chapitres/02-work-environment.typ"
#pagebreak()

#include "chapitres/03-astrophysical-background.typ"
#pagebreak()

// Chapitre 4 : Contributions (chaque fichier gèrera ses propres sections ==)
#include "chapitres/04-contributions/01-setup-and-preliminary-tests.typ"
#include "chapitres/04-contributions/02-variable-ye-methodology.typ"
#include "chapitres/04-contributions/03-analysis-pipeline.typ"
#include "chapitres/04-contributions/04-challenges-and-pitfalls.typ"
#include "chapitres/04-contributions/05-project-timeline.typ"
#include "chapitres/04-contributions/06-current-results.typ"
#pagebreak()

#include "chapitres/05-conclusion.typ"
#pagebreak()


// --- BACKMATTER ---

// Bibliographie
#bibliography("references.bib", title: [Bibliography], style: "apa")
#pagebreak()

// Glossaire
#include "backmatter/glossaire.typ"
#pagebreak()

// Index (optionnel)
#include "backmatter/index.typ"
#pagebreak()

// Annexes
#include "backmatter/annexes.typ"
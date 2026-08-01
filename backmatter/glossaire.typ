#import "@preview/glossarium:0.5.0": make-glossary, print-glossary

// 1. Initialisation du glossaire pour Typst
#show: make-glossary

// 2. Définition de tes termes techniques (FR -> EN)
#let glossary-entries = (
  (
    key: "snia",
    short: "SN Ia",
    long: "Type Ia Supernova",
    description: [Supernova de type Ia. Explosion thermonucléaire d'une naine blanche carbone-oxygène ayant dépassé la masse de Chandrasekhar dans un système binaire.]
  ),
  (
    key: "wd",
    short: "WD",
    long: "White Dwarf",
    description: [Naine blanche. Cœur résiduel compact et dégénéré d'une étoile de masse faible à intermédiaire. La masse maximale d'une naine blanche est la masse de Chandrasekhar, soit environ 1,4 masses solaires.]
  ),
  (
    key: "deflagration",
    short: "Déflagration thermonucléaire",
    long: "Thermonuclear deflagration",
    description: [Régime de combustion subsonique entretenu par le couplage entre conduction thermique et réactions de fusion thermonucléaires.]
  ),
  (
    key: "eos",
    short: "EoS",
    long: "Equation of State",
    description: [Équation d'état. Relation thermodynamique reliant la pression, la masse volumique et la température de la matière stellaire.]
  ),
)

// 3. Affichage du glossaire dans le document
#heading(level: 1, numbering: none)[Glossary / Glossaire]

#print-glossary(glossary-entries)
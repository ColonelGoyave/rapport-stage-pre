// 1. Dictionnaire des termes avec forme longue (long) et courte (short)
#let entry-dict = (
  snia: (
    short: "SN Ia",
    long: "type Ia supernova",
    fr: "Supernova de type Ia",
    def: [Thermonuclear explosion of a carbon-oxygen white dwarf exceeding the Chandrasekhar mass limit in a binary system.]
  ),
  wd: (
    short: "WD",
    long: "white dwarf",
    fr: "Naine blanche",
    def: [Compact and degenerate stellar remnant of a low-to-intermediate-mass star. The maximum mass of a white dwarf is the Chandrasekhar limit ($approx 1.4 M_top$).]
  ),
  deflagration: (
    short: "deflagration",
    long: "thermonuclear deflagration",
    fr: "Déflagration thermonucléaire",
    def: [Subsonic combustion regime sustained by thermal conduction coupled with nuclear fusion reactions.]
  ),
  eos: (
    short: "EoS",
    long: "equation of state",
    fr: "Équation d'état",
    def: [Thermodynamic relation connecting pressure, mass density, and temperature of stellar matter.]
  ),
  network: (
    short: "network",
    long: "nuclear reaction network",
    fr: "Réseau thermonucléaire",
    def: [Set of nuclear reactions and their rates that describe the evolution of stellar matter in thermonuclear fusion reactions.]
  ),
  flame_speed: (
    short: "flame speed",
    long: "laminar flame speed",
    fr: "Vitesse de flamme laminaire",
    def: [Speed at which a flame propagates through a combustible mixture under idealized conditions in a laminar flow.]
  ),
)

// =================================================================
// 2. FONCTIONS DE RÉFÉRENCE DANS LE TEXTE
// =================================================================

// Utilitaire : met la première lettre en majuscule (pour début de phrase)
#let cap(s) = {
  let chars = s.clusters()
  if chars.len() > 0 {
    upper(chars.at(0)) + chars.slice(1).join()
  } else {
    s
  }
}

// --- Formes minuscules (milieu de phrase) ---
#let gls(key) = {
  let e = entry-dict.at(key)
  link(label(key))[#e.short]
}

#let glsf(key) = {
  let e = entry-dict.at(key)
  if e.short != e.long {
    link(label(key))[#e.long (#e.short)]
  } else {
    link(label(key))[#e.long]
  }
}

#let glsl(key) = {
  let e = entry-dict.at(key)
  link(label(key))[#e.long]
}

// --- Formes Majuscules (début de phrase) ---
#let Gls(key) = {
  let e = entry-dict.at(key)
  link(label(key))[#cap(e.short)]
}

#let Glsf(key) = {
  let e = entry-dict.at(key)
  if e.short != e.long {
    link(label(key))[#cap(e.long) (#e.short)]
  } else {
    link(label(key))[#cap(e.long)]
  }
}

#let Glsl(key) = {
  let e = entry-dict.at(key)
  link(label(key))[#cap(e.long)]
}

// --- Interception automatique des @clé dans le texte ---
#let setup-glossary-refs(body) = {
  show ref: it => {
    let key = str(it.target)
    if key in entry-dict {
      gls(key)
    } else {
      it
    }
  }
  body
}

// =================================================================
// 3. AFFICHAGE DU TABLEAU DU GLOSSAIRE
// =================================================================
= Glossary / Glossaire

#v(1.5em)

#table(
  columns: (1.5fr, 1.3fr, 2.7fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + black) } else { 0.5pt + luma(220) },
  fill: (x, y) => if y == 0 { rgb("f8f9fa") } else { none },
  inset: 9pt,
  align: (x, y) => if y == 0 { center + horizon } else { left + top },
  
  [*English Term (Acronym)*], [*French Translation*], [*Definition*],
  
  ..entry-dict.pairs().map(((key, entry)) => (
    [
      *#cap(entry.long) (#entry.short)* #label(key)
    ], 
    [#entry.fr], 
    entry.def
  )).flatten()
)
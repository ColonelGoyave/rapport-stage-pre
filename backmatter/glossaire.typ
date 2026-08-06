// 1. Dictionnaire des termes avec forme longue (long) et courte (short)
#heading(level: 1, numbering: none)[Glossary / Glossaire]
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
  hpc: (
    short: "HPC",
    long: "High-Performance Computing",
    desc: "Computing infrastructure using supercomputers or parallel processing clusters to run complex, computationally intensive simulations.",
  ),
  vpn: (
    short: "VPN",
    long: "Virtual Private Network",
    desc: "Encrypted network connection that enables secure access to internal institute servers and remote resources.",
  ),
  ssh: (
    short: "SSH",
    long: "Secure Shell",
    desc: "Cryptographic network protocol used for secure remote command-line login and system administration on HPC clusters.",
  ),
)

// =================================================================
// 2. FONCTIONS DE RÉFÉRENCE ET DE SUIVI
// =================================================================

#let cap(s) = {
  let chars = s.clusters()
  if chars.len() > 0 {
    upper(chars.at(0)) + chars.slice(1).join()
  } else {
    s
  }
}

// Balise invisible enregistrée pour l'index
#let mark(key) = [#metadata((key: key))<gls-ref>]

// --- Formes minuscules (milieu de phrase) ---
#let gls(key) = {
  let e = entry-dict.at(key)
  [#link(label(key))[#e.short]#mark(key)]
}

#let glsf(key) = {
  let e = entry-dict.at(key)
  if e.short != e.long {
    [#link(label(key))[#e.long (#e.short)]#mark(key)]
  } else {
    [#link(label(key))[#e.long]#mark(key)]
  }
}

#let glsl(key) = {
  let e = entry-dict.at(key)
  [#link(label(key))[#e.long]#mark(key)]
}

// --- Formes Majuscules (début de phrase) ---
#let Gls(key) = {
  let e = entry-dict.at(key)
  [#link(label(key))[#cap(e.short)]#mark(key)]
}

#let Glsf(key) = {
  let e = entry-dict.at(key)
  if e.short != e.long {
    [#link(label(key))[#cap(e.long) (#e.short)]#mark(key)]
  } else {
    [#link(label(key))[#cap(e.long)]#mark(key)]
  }
}

#let Glsl(key) = {
  let e = entry-dict.at(key)
  [#link(label(key))[#cap(e.long)]#mark(key)]
}

// --- Interception automatique des @clé ---
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
// 3. GENERATION DE L'INDEX
// =================================================================
#let make-index() = {
  heading(level: 1, numbering: none)[Index]
  v(1.5em)

  // Annule le retrait de paragraphe uniquement pour la page d'index
  set par(first-line-indent: 0pt)

  context {
    let refs = query(<gls-ref>)
    let key-pages = (:)

    for r in refs {
      let k = r.value.key
      let pg = r.location().page()
      if k in key-pages {
        if not key-pages.at(k).contains(pg) {
          key-pages.at(k).push(pg)
        }
      } else {
        key-pages.insert(k, (pg,))
      }
    }

    let sorted-keys = entry-dict.keys().sorted(key: k => entry-dict.at(k).long)

    for k in sorted-keys {
      if k in key-pages {
        let entry = entry-dict.at(k)
        let pages-str = key-pages.at(k).map(str).join(", ")
        
        [
          *#cap(entry.long)* (#entry.short)
          #box(width: 1fr, repeat[ . ])
          #pages-str
        ]
        parbreak()
      }
    }
  }
}

// =================================================================
// 4. TABLEAU DU GLOSSAIRE
// =================================================================

#v(1.5em)

#table(
  columns: (1.2fr, 1.8fr, 2.7fr),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + black) } else { 0.5pt + luma(220) },
  fill: (x, y) => if y == 0 { rgb("f8f9fa") } else { none },
  inset: 9pt,
  align: (x, y) => if y == 0 { center + horizon } else { left + top },
  
  [*Acronym*], [*Full Name*], [*Definition*],
  
  ..entry-dict.pairs().map(((key, entry)) => (
    [
      *#entry.short* #label(key)
    ], 
    [#cap(entry.long)], 
    [#entry.at("desc", default: entry.at("def", default: ""))]
  )).flatten()
)
# Rapport de Stage de recherche de fin de Master 1 de l'ENSTA Paris – Projet de Recherche (PRe)

Ce dépôt contient le code source et la structure de rédaction de mon rapport de stage de recherche (fin de M1) d'école d'ingénieurs (ENSTA Paris), effectué dans le domaine de l'astrophysique au Heidelberg Institute for Theoretical Studies (HITS) du 25/05/2026 au 16/08/2026.

## 📌 Présentation du Projet
* **Élève :** Alexis SPAETH--LEMARCHAND
* **Établissement :** ENSTA Paris
* **Sujet :** Flammes de déflagration thermonucléaires dans les supernovae de type Ia
* **Structure d'accueil :** Heidelberg Institute for Theoretical Studies (HITS)
* **Tuteurs :** Jean BOISSON (ENSTA Paris) / Prof. Dr. Friedrich K. RÖPKE (HITS)

---

## 🛠️ Outils & Compilation

Le rapport est rédigé en **[Typst](https://typst.app/)**.

### Prérequis
Pour installer Typst :
```bash
# Via Cargo (Rust)
cargo install typst-cli

# Via Homebrew (macOS/Linux)
brew install typst

```

## 📂 Structure du dépôt

```text
.
├── config.typ                     # Template de mise en page (page de titre, en-têtes, pieds de page)
├── main.typ                       # Fichier maître assemblant l'ensemble du rapport
├── references.bib                 # Base de données bibliographique (BibTeX)
├── README.md                      # Documentation du projet
├── assets/                        # Images non-scientifiques (logos de l'ENSTA, logo du HITS, illustration de la page de garde)
├── figures/                       # Graphiques, courbes, schémas
├── frontmatter/                   # Sections préliminaires
│   ├── confidentialite.typ        # Note de non-confidentialité
│   └── remerciements.typ          # Remerciements
├── chapitres/                     # Corps principal du rapport
│   ├── introduction.typ           # Introduction générale
│   ├── description-travail.typ    # Présentation du sujet et du cadre de recherche
├── datasets/                      # Donnees ayant servi a la realisation des derniers graphes et courbes
│   ├── contribution/              # Travaux réalisés et résultats
│   │   ├── introduction.typ
│   │   ├── methodologie.typ
│   │   ├── resultats.typ
│   │   ├── discussion.typ
│   │   ├── planning.typ           # Planning du stage
│   │   └── conclusion.typ
│   └── conclusion.typ             # Conclusion générale et perspectives
└── backmatter/                    # Éléments de fin de document
    ├── annexes.typ                # Annexes techniques
    ├── glossaire.typ              # Glossaire des termes et acronymes
    └── index.typ                  # Index (optionnel)

```

## 🔬 Reproductibilité des résultats & Simulations

Les simulations numériques présentées dans ce rapport ont été réalisées avec le code open-source Phlegethon sur le cluster de calcul haute performance Genoa du HITS.

Les données brutes de simulation représentant plusieurs dizaines de Téraoctets, elles restent hébergées sur un des ensemble de stockage du HITS : Basement, et ne sont pas incluses dans ce dépôt.

Toutefois, la chaîne d'analyse et de visualisation est entièrement documentée et disponible :

    Code de simulation Phlegethon : [Dépôt GitHub de Phlegethon (Leidi + (2026))](https://github.com/phlegethon-stellar-hydro/phlegethon)

    Scripts d'analyse : Les scripts Python permettant le post-traitement des données brutes des simulations et qui ont permis la génération des figures du rapport sont situés dans le dossier [`scripts/`](./scripts/).

    Données finales : Les fichiers de données nécessaires aux tracés finaux peuvent être trouvés dans le dossier [`datasets/`](./datasets/).

[⬅️ Retour au sommaire](README.md)

# Structure du projet

## Arborescence prévue

- `index.html` → page d’accueil (façade immobilière).  
- `annonces.html` → liste des annonces.  
- `fiche-annonce.html` → fiche détaillée d’une annonce.  
- `contact.html` → formulaire de contact.  
- `apropos.html` → présentation de l’équipe.  
- `puzzle.html` → page avec la maison et le quadrillage interactif.  
- `chat.html` (ou section cachée) → chat espion.  

## Fonctionnement du puzzle

- Une **image de la maison de face** est affichée.  
- Un **quadrillage interactif** permet de cliquer sur des cases (ouvert/fermé).  
- La combinaison est vérifiée en JavaScript avec une matrice binaire.  
- Si la combinaison est correcte → déblocage du chat espion.

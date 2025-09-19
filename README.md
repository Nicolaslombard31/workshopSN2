# ImmoVation — Workshop SN2

## Objectif principal
Produire en équipe un prototype fonctionnel (POC) de gadget espion numérique répondant aux critères suivants :

- Fonction espionne claire : discrétion, communication secrète, détection, ruse ou diversion.  
- Réaliste et réalisable avec le matériel et les outils fournis.  
- Pas besoin d’un design final, mais le cœur fonctionnel doit fonctionner (même partiellement).

---

## Contraintes techniques et fonctionnelles

### Contraintes techniques
- Utiliser au moins un capteur et/ou un actionneur.  
- Intégrer une couche logicielle (script Python, page web, micro-site, etc.).  
- Prévoir une méthode de communication/alerte (ex. MQTT, webhook, message caché…).  
- Ajouter une sécurité minimale (authentification, code secret, obfuscation).  
- Code versionné (Git) et documenté (README + schémas).  
- Respecter les normes de sécurité du Q-Lab : *“Un bon gadget n’explose pas, normalement.”*

### Contraintes fonctionnelles
- Le dispositif doit rester discret (faible bruit, pas ostentatoire).  
- Workflow utilisateur simple (rôles : agent = 007 / Q / autre).  
- Scénario d’usage clair : « Comment ce gadget sauve James Bond ? »  

> “N’oubliez pas : un bon gadget ne fait pas de bruit.  
> Il écoute. Il attend. Il agit quand il faut.  
> Et surtout… il n'explose pas (normalement).”

---

## Sujet du projet
Nous avons créé un **faux site d’immobilier** qui sert de façade pour dissimuler un second site : un **chat espion**.  
L’objectif est de démontrer comment une interface familière (site vitrine d’une agence immobilière) peut masquer une fonctionnalité cachée, déverrouillable uniquement via un **puzzle visuel**.

Le faux site immobilier inclut :
- Une page d’accueil avec un moteur de recherche.  
- Des annonces avec fiches détaillées.  
- Une page contact avec formulaire.  
- Une page « À propos » présentant l’équipe fictive.

👉 Le chat espion est accessible uniquement en trouvant la **bonne combinaison de volets fermés** sur l’image d’une maison.

---
### Interet du site 

🎭 Une couverture crédible
En façade, c’est un site immobilier classique.
Pour un ennemi ou un espion rival, rien ne laisse penser qu’il s’agit d’un outil de communication secrète.
Cela permet à 007 de passer inaperçu, car il consulte un site banal comme n’importe quel citoyen.

🕵️ Un canal secret de communication
Derrière ce site se cache un chat espion dissimulé.
L’accès est protégé par un puzzle visuel (les volets d’une maison), connu seulement des agents du MI6.
Une fois la bonne combinaison trouvée, 007 peut échanger des messages sécurisés avec Q ou d’autres agents.

👉 Pourquoi c’est utile pour 007 ?
Cela lui permet de communiquer avec le QG sans éveiller les soupçons.
Même si un adversaire intercepte son trafic réseau, il ne verra qu’un simple site immobilier.
La sécurité repose sur l’obfuscation (fausse identité du site) et sur un accès caché.

---

## Structure du projet et technologies utilisées

**Technologies :**
- Python / [Django](django.md)  
- [JavaScript](javascript.md)  
- [Tailwind](tailwind.md) / CSS / HTML  
- PostgreSQL  
- Git  
- Jira

---

### Arborescence prévue

```
projet/
├── .git/                    
├── .idea/                   
├── DjangoProject/           
│   ├── .idea/               
│   ├── .venv/               
│   ├── agent_secret/        
│   │   ├── __pycache__/     
│   │   ├── __init__.py      
│   │   ├── asgi.py          
│   │   ├── settings.py      
│   │   ├── urls.py          
│   │   └── wsgi.py          
│   ├── communication_secrete/ 
│   │   ├── __pycache__/     
│   │   ├── migrations/      
│   │   ├── __init__.py
│   │   ├── admin.py         
│   │   ├── apps.py          
│   │   ├── models.py        
│   │   ├── tests.py         
│   │   ├── urls.py          
│   │   └── views.py         
│   ├── templates/           
│   │   ├── chat.html        
│   │   └── login.html       
│   ├── .env                 
│   ├── .gitignore
│   ├── db.sqlite3           
│   └── manage.py            
├── html/                    
│   ├── css/
│   │   ├── custom.css       
│   │   └── styles.css       
│   ├── index.html
│   ├── a_propos.html
│   ├── annonce.html
│   ├── code_maison.html
│   ├── contact.html
│   ├── reserver.html
│   ├── image/               
└── README.md               

```
## Fonctionnement du puzzle

- Une **image** de la maison (vue de façade) est affichée.  
- Un **quadrillage interactif** permet de cliquer sur des cases (ouvert/fermé).  
- La combinaison est vérifiée en JavaScript via une matrice binaire.  
- Si la combinaison est correcte → déblocage du chat espion.

---


## Axes d’améliorations

- Création d'animation sur l'ouverture/fermeture des volets de la maison
- Séparation du HTML et du JavaScript dans 2 fichiers distincts pour chaque élément


---

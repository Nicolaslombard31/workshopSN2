# ImmoVation — Workshop SN2

## Sujet du projet
Nous avons créé un **faux site d'immobilier** qui sert de façade pour dissimuler un second site : un **chat espion**.  
L’idée est de démontrer comment une interface familière (site vitrine d’agences immobilières) peut masquer une fonctionnalité cachée, déverrouillable uniquement via un **puzzle visuel**.

Le faux site immobilier inclut :  
- Une page d’accueil avec un moteur de recherche.  
- Des annonces avec fiches détaillées.  
- Une page contact avec formulaire.  
- Une page À propos présentant l’équipe fictive.  

👉 Le chat espion est accessible uniquement en trouvant la **bonne combinaison de volets fermés** sur l’image d’une maison.
---
## Structure du projet

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
│   └── test.html
├── image/                   
└── README.md               

```

### Fonctionnement du puzzle

- Une **image de la maison de face** est affichée.  
- Un **quadrillage interactif** permet de cliquer sur des cases (ouvert/fermé).  
- La combinaison est vérifiée en JavaScript avec une matrice binaire.  
- Si la combinaison est correcte → déblocage du chat espion.

- [Sujet du projet](sujet-projet.md)  
- [Contraintes imposées](contraintes-imposees.md)  
- [Technologies utilisées](technologies-utilisees.md)  
- [Structure du projet](structure-projet.md)  
- [Axes d’améliorations](axes-ameliorations.md)  
- [Annexes](annexes.md)

---

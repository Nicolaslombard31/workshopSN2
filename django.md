#### [← Retour](README.md)
# 🕵️ Projet Django – Communication Secrète

## 1. Qu’est-ce que Django ?
[Django](https://www.djangoproject.com/) est un **framework web Python** qui permet de développer des applications rapidement, de manière sécurisée et organisée.  
Il repose sur l’architecture **MVT (Model – View – Template)** :

- **Model** : représente les données (ex. table des messages).  
- **View** : gère la logique (ex. envoyer un message).  
- **Template** : gère l’affichage (ex. la page de chat).  

---

## 2. Pourquoi et comment l’utiliser ?
### Pourquoi ?
- Gain de temps (fonctionnalités intégrées comme l’authentification).  
- Sécurité renforcée.  
- Organisation claire du projet.  

### Comment ?
1. Créer un projet :  
   ```bash
   django-admin startproject agent_secret
   ```
2. Créer une application :  
   ```bash
   python manage.py startapp communication_secrete
   ```
3. Définir les modèles (`models.py`).  
4. Créer les vues (`views.py`) et les routes (`urls.py`).  
5. Lancer le serveur :  
   ```bash
   python manage.py runserver 3000
   ```

---

## 3. Héritage en Python
L’**héritage** permet de créer une classe à partir d’une autre.  

Exemple :  
```python
class Animal:
    def parler(self):
        print("Je fais un bruit")

class Chien(Animal):
    def parler(self):
        print("J’aboie 🐶")
```
👉 Dans Django, l’héritage est partout :  
- Les modèles héritent de `models.Model`.  
- Les vues peuvent hériter de `View`.  
- Les templates HTML héritent via `{% extends %}`.  

---

## 4. Rôle des fichiers
### Projet `agent_secret/`
- **settings.py** → configuration (DB, apps, sécurité).  
- **urls.py** → routes globales.  
- **wsgi.py / asgi.py** → déploiement.  
- **__init__.py** → module Python.  

### Application `communication_secrete/`
- **models.py** → définition des données (ex. `Message`).  
- **views.py** → logique (ex. afficher le chat).  
- **urls.py** → routes propres à l’app.  
- **admin.py** → panneau d’administration.  
- **apps.py** → configuration de l’app.  
- **migrations/** → historique DB.  
- **tests.py** → tests automatiques.  

### Templates
- **chat.html** → interface du chat.  
- **login.html** → page de connexion.  

### Racine
- **manage.py** → commandes Django (`migrate`, `runserver`, etc.).  
- **db.sqlite3** → base par défaut.  
- **.env** → variables sensibles (secret key, DB).  
- **.gitignore** → fichiers à exclure du repo.  

---

## 5. Organisation du projet
- `agent_secret/` = **configuration globale du projet**.  
- `communication_secrete/` = **application métier (chat secret)**.  

👉 Tu pourrais ajouter d’autres apps (ex. `missions/`) dans le même projet.

---

## 6. Base de données PostgreSQL
### Installation
```bash
pip install psycopg2
```

### Configuration `.env`
```env
DB_NAME=mi6
DB_USER=agent007
DB_PASSWORD=topsecret
DB_HOST=localhost
DB_PORT=5432
```

### `settings.py`
```python
from decouple import config

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": config("DB_NAME"),
        "USER": config("DB_USER"),
        "PASSWORD": config("DB_PASSWORD"),
        "HOST": config("DB_HOST", default="localhost"),
        "PORT": config("DB_PORT", default="5432"),
    }
}
```

### Migration
```bash
python manage.py migrate
```

---

## 7. Sécurité : `.env` et `.gitignore`
- **.env** : contient les clés secrètes et identifiants.  
  Exemple :
  ```env
  SECRET_KEY=django-insecure-xxxxxx
  DEBUG=True
  ```
- **.gitignore** : empêche l’envoi des fichiers sensibles sur GitHub.  
  Exemple :
  ```
  .venv/
  __pycache__/
  *.sqlite3
  .env
  ```

---

## 8. Fonctionnement du projet
1. L’agent se connecte via `login.html`.  
2. Django vérifie ses identifiants.  
3. Accès à `chat.html`.  
4. Envoi d’un message → sauvegardé en base PostgreSQL.  
5. Une réponse automatique peut être générée après un délai.  
6. Les messages sont listés dans le chat.  

---

## 9. Arborescence du projet
```
DjangoProject/
├── agent_secret/
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
├── communication_secrete/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations/
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   ├── views.py
├── templates/
│   ├── chat.html
│   ├── login.html
├── .env
├── .gitignore
├── db.sqlite3
├── manage.py
```

---

✍️ **Auteur :** Projet Django – Communication Secrète  
📌 **Technologies :** Python, Django, PostgreSQL  
🔑 **Fonctionnalité principale :** Chat sécurisé avec agents secrets  

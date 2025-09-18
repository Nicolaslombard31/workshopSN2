# ⚡ Projet JavaScript – Introduction et Bonnes Pratiques

## 1. Qu’est-ce que JavaScript ?
[JavaScript](https://developer.mozilla.org/fr/docs/Web/JavaScript) est un **langage de programmation** utilisé principalement pour rendre les pages web **dynamiques et interactives**.  
Il est exécuté côté **navigateur** mais aussi côté **serveur** avec **Node.js**.  

👉 JavaScript suit le paradigme **orienté objet** et **fonctionnel**.  

---

## 2. Pourquoi et comment l’utiliser ?
### Pourquoi ?
- Permet de manipuler le **DOM** (contenu HTML).  
- Ajoute de l’**interactivité** (animations, formulaires dynamiques).  
- Fonctionne partout (tous les navigateurs).  
- Écosystème énorme (Node.js, React, Vue, Angular…).  

### Comment ?
1. Intégrer dans une page HTML :  
   ```html
   <script>
     alert("Hello World 🌍");
   </script>
   
2. Utiliser un fichier externe :
   ```html
   <script src="script.js"></script>

3. Exécuter côté serveur (Node.js) :
   ```bash
   node app.js

## 3. Variables et Types
  JavaScript possède plusieurs mots-clés pour déclarer des variables :
  ```js
  let x = 10;        // variable modifiable
  const y = 20;      // constante
  var z = 30;        // ancien mot-clé (à éviter)
```
Types principaux :
String : "texte"
Number : 42
Boolean : true / false
Array : [1, 2, 3]
Object : {nom: "Alice", age: 25}

## 4. Fonctions
  ### Déclaration classique
  ```js
  function addition(a, b) {
  return a + b;
  }
  ```
  ### Fonction fléchée
  ```js
  const addition = (a, b) => a + b;
  ```
## 5. Objets et classes
  ### Objet simple
  ```js
  let utilisateur = {
  nom: "Alice",
  age: 25,
  sePresenter: function() {
    console.log(`Je m’appelle ${this.nom}`);
  }
  };
  ```
  ### Classe et héritage
  ```js
  class Animal {
  parler() {
    console.log("Je fais un bruit");
  }
  }
  
  class Chien extends Animal {
    parler() {
      console.log("J’aboie 🐶");
    }
  }
  
  let medor = new Chien();
  medor.parler(); // "J’aboie 🐶"
  ```



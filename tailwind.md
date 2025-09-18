#### [← Retour](README.md)
# 🎨 Projet Tailwind CSS – Introduction et Bonnes Pratiques

## 1. Qu’est-ce que Tailwind CSS ?
[Tailwind CSS](https://tailwindcss.com/) est un **framework CSS utilitaire** qui permet de créer des interfaces web **rapides, modulables et responsives**.  
Au lieu de classes prédéfinies comme Bootstrap, Tailwind propose des **classes utilitaires** pour chaque propriété CSS (couleurs, marges, paddings, flex, grid…).  

👉 Tailwind suit le principe **"utility-first"**, ce qui rend le code HTML très descriptif et modulable.  

---

## 2. Pourquoi et comment l’utiliser ?
### Pourquoi ?
- Rapidité de prototypage.  
- Styles cohérents et facilement maintenables.  
- Classes réutilisables et combinables.  
- Gestion simple du **responsive design**.  

### Comment ?
#### 1. Installer Tailwind dans un projet :  
```bash
  npm install -D tailwindcss
  npx tailwindcss init
```
#### 2. Configurer tailwind.config.js :
   ```js
   module.exports = {
    content: ["./src/**/*.{html,js}"],
    theme: {
      extend: {},
    },
    plugins: [],
    }
   ```
#### 3. Ajouter Tailwind dans ton CSS :
   ```css
   @tailwind base;
   @tailwind components;
   @tailwind utilities;
   ```
#### 4. Compiler le CSS avec Tailwind CLI :
   ```bash
   npx tailwindcss -i ./src/input.css -o ./dist/output.css --watch
   ```
## 3. Couleurs et espacements
### Exemple de couleur et padding
  ```html
  <div class="bg-blue-500 text-white p-4">
  Couleur de fond bleu et texte blanc
  </div>
  ```
### Exemple de margin et padding
  ```html
  <div class="m-4 p-2">
  Marge et padding avec Tailwind
  </div>
  ```
## 4. Typographie et Bordures
### Typographie
  ```html
  <h1 class="text-2xl font-bold text-gray-800">Titre principal</h1>
  <p class="text-sm text-gray-600">Petit texte</p>
  ```
### Bordures et ombres
  ```html
  <div class="border border-gray-300 rounded-lg shadow-lg p-4">
  Carte stylisée
  </div>
  ```
## 5. Flexbox et Grid
### Flex
  ```html
  <div class="flex justify-between items-center">
  <div>Item 1</div>
  <div>Item 2</div>
  </div>
  ```
### Grid
  ```html
  <div class="grid grid-cols-3 gap-4">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  </div>
  ```
## 6. Page responsive
### Tailwind facilite le design adaptatif avec des préfixes breakpoint :
  
  #### sm: → ≥ 640px
  #### md: → ≥ 768px
  #### lg: → ≥ 1024px
  #### xl: → ≥ 1280px
  
### Exemple responsive
  ```html
  <div class="text-sm md:text-lg lg:text-xl">
  Texte qui s’adapte à la taille de l’écran
  </div>
  ```







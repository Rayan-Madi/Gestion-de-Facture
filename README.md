# 🧾 Facture-Pro (COBOL)

![COBOL](https://img.shields.io/badge/Language-COBOL-blue?logo=COBOL&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Windows%20|%20Linux%20|%20macOS-lightgrey?style=flat-square)

---

## 👋 Présentation

Bienvenue sur **Facture-Pro**, un  projet COBOL pour générer des factures automatiquement !  

💡 Vous saisissez vos articles, leur quantité et leur prix, et le programme crée un fichier texte `facture.txt` clair et bien formaté.  

Idéal pour :  
- 🌟 Découvrir la programmation COBOL moderne  
- 📄 Manipuler des fichiers séquentiels  
- 💰 Calculer automatiquement HT, TVA et TTC  
- 🔄 Pratiquer les boucles et la saisie utilisateur  

---

## ✨ Fonctionnalités

- 📝 Saisie interactive de plusieurs articles (nom, quantité, prix unitaire)  
- ➕ Calcul automatique du **total HT**, **TVA** et **total TTC**  
- 📂 Génération d’un fichier texte `facture.txt` formaté  
- 💻 Compatible **Windows / Linux / macOS**  
- 🆓 Code en **free format COBOL** pour plus de lisibilité et compatibilité  

---

## 🖥️ Prérequis

Avant de commencer, assurez-vous d’avoir :  

1. **Un compilateur COBOL**  (obligatoire)
   - Par exemple [GnuCOBOL](https://superbol.eu/developers/windows/)  
2. **VS Code** pour éditer le code facilement  (favorable mmais un autre éditeur peut etre acceptable)
3. **Extensions VS Code recommandées** :  (obligatoire si vous éditez sur VS Code)
   - `COBOL` (support GnuCOBOL)  
   - `COBOL Language Support`  

💡 Astuce : utilisez l’**encodage UTF-8 sans BOM** et remplacez les tabs par des espaces pour éviter les erreurs.

---

## ⚙️ Installation & utilisation

 | Cloner le dépôt |
```bash
git clone https://github.com/Rayan-Madi/facture-pro.git
cd facture-pro

1 Compiler le programme :

cobc -x -free facture-pro.cob -o facture-pro.exe
(N'OUBLIEZ PAS DE RECOMPILER LE PROGRAMME CHAQUE FOIS QUE VOUS MODIFIEZ LE CODE !)

2 Lancer le programme :

./facture-pro.exe
📂 Le fichier facture.txt sera généré automatiquement dans le dossier courant.

| SI TOUT FONCTIONNE ALORS | 

- Exemple de sortie (facture.txt)
=========== FACTURE ===========
Article              Qte      PU       Total
-----------------------------------------------
Stylo                 10     1.50     15.00
Cahier                 5     3.20     16.00
-----------------------------------------------
TOTAL HT   : 31.00
TVA (20%)  : 6.20
TOTAL TTC  : 37.20
=========== FIN FACTURE ===========

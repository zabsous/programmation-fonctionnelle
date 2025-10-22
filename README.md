# TPV5 — Algorithmes de graphes en OCaml

Ce projet est un **TP de programmation fonctionnelle en OCaml** portant sur la **manipulation de graphes** : recherche de successeurs, marquage de sommets, génération de chemins, et parcours retour.

## 📚 Sommaire

- [Description](#-description)
- [Structure du graphe](#-structure-du-graphe)

---

## 🧭 Description

Le fichier `tpv5.ml` contient des fonctions permettant de :

- Représenter un graphe non orienté sous forme de liste d’adjacence.
- Récupérer les successeurs d’un sommet.
- Marquer des sommets pour simuler un passage.
- Trouver tous les chemins possibles entre deux sommets avec une longueur donnée.
- Faire un parcours retour en utilisant uniquement les sommets marqués.
- Supprimer de manière aléatoire les marques de certains sommets (fonction `enlever_marques`).

L’exemple principal correspond à une **simulation de parcours dans un graphe** semblable à un labyrinthe.

---

## 🕸 Structure du graphe

Le graphe est représenté sous la forme :

```ocaml
(id_sommet, marque, successeurs)

# Compresseur de données

**Language** :  Batch Windows
**Données source** : Raster GeoTIFF
**Données de sortie** : Raster GeoTIFF

## Mise en place

Il suffit simplement de cloner ce dépot où vous le souhaitez, et de disposer de GDAL installer sur votre PC avec son chemin d'installation indiqué dans votre variable d'environnement *PATH*

## Utilisation
1- Exécutez le script
2- Indiquez le chemin d'un dossier contenant les données à compresser
3- Indiquez le chemin d'un dossier où déposez les données une fois compressées
4- Indiquez un titre que vous souhaitez voir apparaitre dans la barre de titre de la fenêtre de l'interpreteur de commande
5- Le programme vas executer la compression sur toute les données du dossier
6- Une fois la compression terminée, appuyez sur entrée pour fermer la fenêtre de commande

## Fonctionnement
- L'affichage des instructions est désactivé
- L'option CLS permet d'utiliser des variables dans des instructions recurcives
- Encodeage du retour texte de la fenêtre de commande en UTF-8
- Définition d'une variable *nom* portant le nom du script
- Définition d'une variable *titre* contant le titre de la fenêtre d'execution du script
- Changement du titre de la fenêtre
- Création d'une variable *input* contenant le chemin du dossier contenant les données par demande à l'utilisateur
- Création d'une variable *output* contenant le chemin du dossier où déposer les données par demande à l'utilisateur
- Création d'une variable *complement_titre* pour que l'utilisateur puisse indiqué un nom particulier à donnée à la fenêtre pour s'y retrouver si il en exécute plusiseurs 
- Boucle sur les fichiers **GeoTIF** présent dans le dossier indiqué par la variable *input*
- Modification de la variable *titre* pour qu'elle se compose des variables *nom*, *complement_titre* et la *valeur de la boucle*
- Définition du titre à partire de la variable *titre*
- affichage dans la fenêtre d'execution du nom du fichier traité, *valeur de la boucle*
- execution du programe gdal_translate avec comme option :
	- *of* : le format GeoTIFF des données en sortie
	- *co* : Les différentes option supplémentaire :
		- *COMPRESS* : Compression de type DEFLATE
		- *PREDICTOR* : 2 (J'ai oublé pourquoi)
		- *ZLEVEL* : Niveau de compression fixé à 6, un bon compromis entre l'efficacité de la compression et la durée d'execution
	- Le chemin de la donnée en entrée composé des variable *input* et de la *valeur de la boucle*
	- Le chemin de la donnée en sortie composé des variable *output* et de la *valeur de la boucle*
- Sortie de la boucle et formule de politesse de fin de script
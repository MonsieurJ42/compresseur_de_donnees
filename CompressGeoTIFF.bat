:: ------------------------------------------------------------------------------------------------
:: ---- Optimisation de la taille des données d'un dossier par compression
:: ---- auteur : J. Ollier - EVS-ISTHME - CNRS UMR 5600
:: ------------------------------------------------------------------------------------------------
:: Header classique
@echo off
setlocal enabledelayedexpansion
:::: Passage du retour du terminal en UTF-8
chcp 65001
cls
:: ------------------------------------------------------------------------------------------------
set nom=Optimisation des données
set titre=%nom%
title %titre%
:: Nom du secteur dans lequel importé la variable
set /p input=Dossier contenant les données sources à compresser (ex : C:\Chemin\vers\mes\input) : 
:: Récupération des découpes
set /p output=Dossier où poser les données sources compresser (ex : C:\Chemin\vers\mes\output) : 
set /p complement_titre=Un petit nom a mettre en titre de la fenêtre d'éxecution (exemple pour indiquer la zone ) : 
:: Boucle de compression
for /f "eol=: delims=" %%f IN ('dir /b %input%\*.tif') DO (
	:: Découpage de la donnée source à 25m
	set titre=%nom% - %complement_titre% - %%f
	title !titre!
	echo %%f
	gdal_translate -of GTiff -co "COMPRESS=DEFLATE" -co "PREDICTOR=2" -co "ZLEVEL=6" %input%\%%f %output%\%%f
)
:: Fin
echo Les données sont compressées
set titre=%nom% - %zone% - fini
title %titre%
pause
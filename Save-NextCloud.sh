#!/bin/bash 
echo ""
echo "Save nextcloud 1.0"
echo "By Randoye"
echo ""
#### Préparation des variables
filenamesave="save-$(date -I)"
filenamedb="savedb-$(date -I).sql"
sourcepathfile="/var/www/html/nextcloud/data/Admin/files"
sourcepathdb="$(pwd)$filenamedb"
destpathfile="sauvegarde/files/$filenamesave"
destpathdb="sauvegarde/files/$filenamedb"
#### Debut du script
echo "Starting the save script"
echo ""
rclone copy $sourcepathfile save:$destpathfile
echo "The transfert of NextCloud Files has been done !"
echo ""
echo "Start the save function for the database"
echo ""
mysqldump --routines -u root --password=pass  Nextcloud > $filenamedb #Permet d'exporter toutes la base de données fonctions inclus
rclone copy $filenamedb save:$destpathdb # utilise Rclone pour envoyer la sauvegarde dans le dossier "db"
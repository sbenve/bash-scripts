# bash-scripts
Scripts de bash que uso para automatizar mis instalaciones de GNU/Linux (en general Ubuntu)

### update-nextcloud-appimage.sh
Para actualizar el cliente de Nextcloud en formato AppImage. Puede ejecutarse a cada inicio o manualmente al recibir la notificación del mismo cliente. Sustituye el archivo AppImage, pero no mata el cliente en ejecución.
Requiere: wget

### update-authorizedkeys.sh
Para configurar el servidor SSH de modo que acepte un archivo de llaves públicas globales, para agilizar la administración de sistemas remotamente.
Requiere: Servidor SSH; wget

# bash-scripts
Scripts de bash que uso para automatizar mis instalaciones de GNU/Linux (en general Ubuntu)
### update-nextcloud-appimage.sh
Para actualizar el cliente de Nextcloud en formato AppImage. Puede ejecutarse a cada inicio o manualmente al recibir la notificación del mismo cliente. Sustituye el archivo AppImage, pero no mata el cliente en ejecución.
Requiere: wget
### update-authorizedkeys.sh
Para configurar el servidor SSH de modo que acepte un archivo de llaves públicas globales, para agilizar la administración de sistemas remotamente.
Requiere: Servidor SSH; wget
### resize-pics.sh
De la ubicación indicada, toma todas las imagenes con extensión .jpg en mayúsculas y minúsculas y las redimensiona al 40% del tamaño y con una calidad del 85%. Todas son creadas con extensión .jpeg y reubicadas en un subdirectorio nuevo. Usado principalmente para tener copias manejables de archivos de fotografía originales, haciendo que su inclusión en documentos de texto sea más eficiente.
Puede usarse como acción en el administrador de archivos gráfico (por ej: Thunar)
Requiere: imagemagick

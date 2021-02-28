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

### new-ubuntu-2004.sh
Realiza las tareas básicas de la post-instalación de un sistema GNU/Linux basado en Ubuntu 20.04; Incluyendo herramientas básicas para usar en la consola, distintos shell alternativos a bash, instala el servidor SSH. Para cuando se trate de una instalación con entorno de escritorio installa Google Chrome y Google Earth desde los repositorios oficiales de paquetes DEB, clientes de torrent Transmission y opciones según el entorno específico. También clona el presente repositorio instalando copias ejecutables de los scripts y los usa para configurar SSH e instalar el cliente de Nextcloud.

### my-public-ip.sh
La salida es la IP pública reportada por dyndns.org.

Requiere: curl

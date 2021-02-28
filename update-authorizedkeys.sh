#!/bin/bash
authfile="/etc/ssh/authorized_keys"
fileurl="https://YOURDOMAILN/YOUR_authorized_keys"
sshdconf="/etc/ssh/sshd_config"

#Root check
if [[ $(id -u) > 0 ]]
then
        echo "No tiene privilegios de administrador para una instalación global."
        exit 1
fi

#Enable global authorized_keys
echo "Cambiando archivo de configuración global $sshdconf"
sed -i "/AuthorizedKeysFile/c\AuthorizedKeysFile .ssh/authorized_keys $authfile" "$sshdconf"

#Download Authorized_keys file from server
echo "Descargando el archivo $fileurl"
wget -q "$fileurl" -O "$authfile"
echo "Ajustando permisos"
chmod 600 "$authfile"
chmod 600 "$sshdconf"

#Restart SSH Server
echo "Reiniciando servidor SSH..."
systemctl restart ssh && echo "Listo."

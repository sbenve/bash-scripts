#!/bin/bash
local_bin=/usr/local/bin/nextcloud-client.appimage


function check_latest {
wget -q -O - https://download.nextcloud.com/desktop/releases/Linux/ | grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' |   sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i' | grep AppImage$ | sed -e 's/Nextcloud-//i' -e 's/-x86_64.AppImage//i' | sort | tail -n 1
}

function check_local {
$local_bin --version 2>/dev/null | grep "^Nextcloud version" | awk '{print $3}' | tr -d [A-Z][a-z]
}

function biggest_ver {
(echo $local_ver ; echo $latest_ver) | sort | tail -n1
}

function download_latest {
echo "Descargando... $remote_file"
wget -q -O "/tmp/$remote_file" "https://download.nextcloud.com/desktop/releases/Linux/$remote_file"
mv "/tmp/$remote_file" "$local_bin"
echo "Ajustando permisos de ejecución..."
chmod +x "$local_bin" || echo "Error!" && echo "Listo!"
}

#declare
latest_ver=$(check_latest)
local_ver=$(check_local)

#compare
greater_ver=$(biggest_ver)

#show
echo "Versión local : $local_ver"
echo "Última versión: $latest_ver"

if [[ "$local_ver" == "$greater_ver" ]]
	then
		echo "Está al día!"
		exit 0
	else
		echo "Hay una versión más reciente"
fi

#update
remote_file="Nextcloud-$latest_ver-x86_64.AppImage"
if [[ $(id -u) > 0 ]]
then
	echo "No tiene privilegios de administrador para una instalación global."
else
	download_latest
fi

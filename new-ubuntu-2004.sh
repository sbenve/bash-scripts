#!/bin/bash
#run as root
if [[ $(id -u) > 0 ]]
then
  echo "Ejecute el script como root!"
  exit 1
fi

#instalación basica
function basic-install {
apt-get update
apt-get install -y squid-deb-proxy-client
apt-get update
apt-get dist-upgrade -y
apt-get install -y ssh wireguard avahi-daemon ethtool wakeonlan \
        nload nmon htop ncdu iftop \
        mc screen tmux pwgen \
        axel aria2 curl wget rsync git \
        fish zsh bash-completion \
        hddtemp lm-sensors \
        lvm2 most unp unzip dosfstools;
cp /usr/share/doc/avahi-daemon/examples/s* /etc/avahi/services/
systemctl enable ssh
systemctl restart ssh
systemctl enable avahi-daemon
systemctl restart avahi-daemon
}

function desktop-extra {
#herramientas
apt-get install -y libemail-outlook-message-perl filezilla \
        imagemagick ffmpeg handbrake simple-scan subtitleeditor;

#inkscape
add-apt-repository ppa:inkscape.dev/stable
apt-get update
apt-get install inkscape

#google chrome y earth
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-apps.list
echo "deb [arch=amd64] http://dl.google.com/linux/earth/deb/ stable main" >> /etc/apt/sources.list.d/google-apps.list
wget -q "https://dl.google.com/linux/linux_signing_key.pub" -O- | apt-key add -
apt-get update
apt-get install -y google-chrome-stable google-earth-pro-stable

#crea usuario secundario
useradd --create-home --uid 1001 --password 123456 second ## CAMBIAR A GUSTO

#permisos de directorios personales
chmod 750 /home/*
}

#instalación por entorno de escritorio
function xfce-install {
apt-get install -y zenity transmission-gtk transmission-remote-gtk
#ksuperkey
apt-get install -y git gcc make libx11-dev libxtst-dev pkg-config
mkdir /tmp/compile-ksuper
cd /tmp/compile-ksuper
git clone https://github.com/hanschen/ksuperkey.git
cd ksuperkey
make
cp ksuperkey /usr/local/bin
chmod 755 /usr/local/bin/ksuperkey
}

function gnome-install {
apt-get install -y zenity transmission-gtk transmission-remote-gtk
}

function kde-install {
apt-get install -y kdialog transmission-qt
}

function server-install {
apt-get install -y unattended-upgrades 
}

#arrancamos
case $1 in
        xfce)
                TARGET="$1" ;;
        gnome)
                TARGET="$1" ;;
        kde)
                TARGET="$1" ;;
        server)
                TARGET="$1" ;;
        *)
                echo "$0 [xfce|gnome|kde|server]" && exit 1;;
esac

#ejecuta instalación básica
basic-install

#obtiene el resto de los scripts del repositorio git
cd /tmp
git clone https://github.com/sbenve/bash-scripts.git
chmod +x bash-scripts/*.sh
mv bash-scripts/*.sh /usr/local/bin
/usr/local/bin/update-authorizedkeys.sh ##hay que cambiar la dirección generica del archivo en el repositorio git
/usr/local/bin/update-youtube-dl.sh

#ejecuta instalación por tipo de esctirorio
$TARGET-install
if [ "$TARGET" != 'server' ]
then
        desktop-extra
        echo "Instalando cliente de Nextcloud..."
        /usr/local/bin/update-nextcloud-appimage.sh
else
        exit 0
fi

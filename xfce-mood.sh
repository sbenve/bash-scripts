#!/bin/bash
terminal_conf_file="$HOME/.config/xfce4/terminal/terminalrc"
terminal_conf_temp="/tmp/xfce4-terminal-conf.tmp"

function xfce4-terminal-theme {
grep -i color -v "$terminal_conf_file" > "$terminal_conf_temp"
grep -i color /usr/share/xfce4/terminal/colorschemes/xubuntu-$1.theme | grep -v FALSE >> "$terminal_conf_temp"
mv "$terminal_conf_temp" "$terminal_conf_file"
}

case $1 in
	dia)
		xfconf-query -c xsettings -p /Net/ThemeName -s Adwaita
		xfconf-query -c xsettings -p /Net/IconThemeName -s elementary-xfce
		xfconf-query -c xfce4-notifyd -p /theme -s Bright
		xfce4-terminal-theme light
	;;
	noche)
		xfconf-query -c xsettings -p /Net/ThemeName -s Adwaita-dark
		xfconf-query -c xsettings -p /Net/IconThemeName -s elementary-xfce-dark
		xfconf-query -c xfce4-notifyd -p /theme -s Greybird
		xfce4-terminal-theme dark
	;;
	*)
		echo "Temas disponibles: dia noche"
	;;
esac

#!/bin/bash
#Selección de archivo
function elzenity {
zenity --title="Recomprimir PDF" --window-icon=/usr/share/icons/elementary-xfce/apps/24/gnome-pdf.png --width=400 --height=250 "$@"
}
file_orig=`elzenity --file-selection $HOME --file-filter='Archivos PDF | *.pdf *.PDF'`
if [[ -z "$file_orig" ]]
	then
#		elzenity --error --text="Faltó elegir el archivo!"
	exit 1
fi
##INSERTAR CODIGO EN CASO DE ERROR
## if file_orig -z then error
file_orig_size=`du "$file_orig" -h | awk {'print $1'}`
#presenta información
page_count=`pdfinfo "$file_orig" | grep ^Pages | awk '{print $2}'`
elzenity --info --text="Tamaño del archivo original: $file_orig_size\nCantidad de páginas: $page_count" --icon-name="/usr/share/icons/elementary-xfce/mimes/96/application-pdf.png"
#pide compresion
new_dpi=`elzenity --hide-column 2 --print-column 2 --list --column "Resolución en DPI:" --column "DPI" "100 - Pantalla de PC (BAJA)" "100" "150 - Para TEXTO" "150" "200 - Calidad INTERMEDIA" "200" "300 - Calidad MEDIA" "300" "600 - Calidad BUENA para IMPRIMIR" "600"`
new_quality=`elzenity --scale --text="Calidad de imágenes:" --value="75" --step="5"`
just_name=`echo "$file_orig" | sed 's/[.].*$//'`
suffix="-recomprimido-$new_dpi-$new_quality.pdf"
new_name="$just_name$suffix"
convert -density $new_dpi -compress JPEG -quality $new_quality "$file_orig" "$new_name" | elzenity --progress --text="Comprimiendo ... " --percentage="1" --pulsate --auto-close --time-remaining
file_new_size=`du "$new_name" -h | awk {'print $1'}`
elzenity --info --text="Tamaño del archivo original: $file_orig_size\n\nTamaño del archivo recomprimido: $file_new_size\n$new_dpi DPI - Calidad $new_quality\n\nGuardado como: $new_name"
xdg-open "$new_name"

#!/bin/bash
if [ -z "$1" ];
  then
    echo "Falta la variable de la ubicación"
    echo " $0 /ubicación/ "
    pause 2s && exit 1
fi
cd "$1"
echo "Lista de imagenes a redimensionar"
echo "================================="
ls *.jpg
ls *.JPG
echo "================================="
echo "Redimensionando"
mogrify -verbose -format jpeg -quality 85 -resize 40x40% *.jpg
mogrify -verbose -format jpeg -quality 85 -resize 40x40% *.JPG
echo "================================="
echo "Creando carpeta: resized"
mkdir resized
echo "================================="
echo "Moviendo archivos"
mv *.jpeg resized/
echo "================================="
echo "Listo!"
echo "================================="
cd -
sleep 2s

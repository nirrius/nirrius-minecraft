#!/bin/sh

# Declarations
map_name=$1
carto_path=/home/minecraft/nirrius-minecraft/cartograph
map_path=$carto_path/../mc-server/maps/$map_name

image_path=/home/minecraft/nirrius-minecraft/site/public/resources/cartographs/$map_name

mkdir /tmp/$map_name
mkdir -p $image_path

# Render oblique and angled cartographs with a ~1000 block perimeter
$carto_path/c10t/c10t -w $map_path -o /tmp/$map_name/oblique_render.png -q -L -85,85,-85,85

$carto_path/c10t/c10t -w $map_path -o /tmp/$map_name/angled_render.png -y -L -85,85,-85,85

# Optimize - imagemagick required.
convert -quality 0 +dither -colors 256 /tmp/$map_name/oblique_render.png /tmp/$map_name/oblique.png

convert -quality 0 +dither -colors 256 /tmp/$map_name/angled_render.png /tmp/$map_name/angled.png

cp /tmp/$map_name/oblique.png $image_path/oblique.png
cp /tmp/$map_name/angled.png $image_path/angled.png

# Clean up - We don't use rm -r because the map_name could be malformed and the script could be run with elevated privlages.
rm /tmp/$map_name/*.png
rmdir /tmp/$map_name


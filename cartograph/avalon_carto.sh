#!/bin/bash

# Declarations
map_name=avalon
carto_path=/home/minecraft/nirrius-minecraft/cartograph
scp=www-developer@nirri.us
map_path=$carto_path/../mc_server/maps/$map_name

image_path=/home/www-server/redacted/site/public/resources/images/cartographs/$map_name

# Render oblique and angled cartographs with a ~1000 block perimeter
$carto_path/c10t/c10t -w $map_path -o /tmp/oblique_render.png -q -L -85,85,-85,85

$carto_path/c10t/c10t -w $map_path -o /tmp/angled_render.png -y -L -85,85,-85,85

# Optimize - imagemagick required.
convert -quality 0 +dither -colors 256 /tmp/oblique_render.png /tmp/oblique.png

convert -quality 0 +dither -colors 256 /tmp/angled_render.png /tmp/angled.png

# The user must have sudoers access to connect via SSH without a password
scp /tmp/oblique.png $scp:$image_path/oblique.png
scp /tmp/angled.png $scp:$image_path/angled.png


# Clean up
rm /tmp/oblique_render.png
rm /tmp/angled_render.png

rm /tmp/oblique.png
rm /tmp/angled.png
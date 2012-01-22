#!/bin/bash
# The map must be restored after reboot and the ramdisk must be writable.
map_name=$1
map_path=/home/minecraft/nirrius-minecraft/mc-server/maps/
savestate_path=/home/minecraft/nirrius-minecraft/mc-server/savestates
cd $map_path
unzip $savestate_path/${map_name}_savestate.zip

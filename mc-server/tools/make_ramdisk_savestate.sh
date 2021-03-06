#!/bin/bash
# Valhalla is on a ramdisk so the map must be backed up for restarts.
map_name=$1
map_path=/home/minecraft/nirrius-minecraft/mc-server/maps/$map_name
savestate_path=/home/minecraft/mc-server/savestates
mkdir -p $savestate_path
cd $map_path
zip -r $savestate_path/ramdisk_savestate.zip *

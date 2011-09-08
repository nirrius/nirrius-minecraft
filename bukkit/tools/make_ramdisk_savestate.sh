#!/bin/bash
# Valhalla is on a ramdisk so the map must be backed up for restarts.
map_name=valhalla
map_path=/home/minecraft/maps/$map_name
savestate_path=/home/minecraft/bukkit/savestate
mkdir -p $savestate_path
cd $map_path
zip -r $savestate_path/ramdisk_savestate.zip *

#!/bin/bash
# The map must be restored after reboot and the ramdisk must be writable.
map_name=valhalla
map_path=/home/minecraft/mc_server/maps/$map_name
savestate_path=/home/minecraft/bukkit/savestates
cd $map_path
unzip $savestate_path/ramdisk_savestate.zip

#!/bin/bash
# The map must be restored after reboot and the ramdisk must be writable.
map_name=$1
map_path=/home/minecraft/nirrius-minecraft/mc-server/maps/$map_name
savestate_path=/home/minecraft/nirrius-minecraft/savestates
cd $map_path
unzip $savestate_path/ramdisk_savestate.zip

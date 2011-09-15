#!/bin/bash
map_name=shangri-la
map_path=/home/minecraft/nirrius-minecraft/mc_server/maps/$map_name
backup_path=/home/minecraft/nirrius-minecraft/mc_server/backups/$map_name/`date "+%m-%d-%H-%M-%S"`.zip

mkdir -p /home/minecraft/backups/$map_name
savestate_path=/home/minecraft/savestate/${map_name}_savestate.zip
cd $map_path; zip -r $backup_path *
cp $backup_name $savestate_path

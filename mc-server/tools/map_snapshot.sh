#!/bin/sh
map_name=$1
map_path=/home/minecraft/nirrius-minecraft/mc-server/maps/$map_name
backup_path=/home/minecraft/nirrius-minecraft/mc-server/backups/$map_name
backup_name=$backup_path/`date "+%m-%d-%H-%M-%S"`.zip
savestate_path=/home/minecraft/nirrius-minecraft/mc-server/savestates

mkdir -p /home/minecraft/nirrius-minecraft/mc-server/backups/$map_name
cd $map_path; zip -r $backup_name *
cp $backup_name $savestate_path/${map_name}_savestate.zip
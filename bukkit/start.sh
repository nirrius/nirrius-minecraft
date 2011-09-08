#!/bin/bash
minecraft_path=/home/minecraft/nirrius-minecraft/bukkit
minecraft_script=./bukkit_start
screen_name=nirrius_mc

cd $minecraft_path; screen -S $screen_name bash -c 'java -Xmx6000M -Xms3000M -server -jar craftBukkit.jar nogui'

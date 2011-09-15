#!/bin/bash
minecraft_path=/home/minecraft/nirrius-minecraft/bukkit
screen_name=nirrius_mc

cd $minecraft_path; screen -S $screen_name bash -c 'java -Xmx6000M -Xms3000M -server -jar craftBukkit.jar nogui'

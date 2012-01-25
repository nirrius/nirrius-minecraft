#!/bin/bash
minecraft_path=/home/minecraft/nirrius-minecraft/mc-server
screen_name=nirrius_mc

cd $minecraft_path; screen -S $screen_name bash -c 'java -Xmx3100M -Xms2000M -server -jar craftBukkit.jar nogui'

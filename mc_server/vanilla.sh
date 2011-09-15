#!/bin/bash
minecraft_path=/home/minecraft/nirrius-minecraft/mc_server
screen_name=nirrius_mc

cd $minecraft_path; screen -S $screen_name bash -c 'java -Xmx6000M -Xms3000M -server -jar minecraft_server.jar nogui'

#!/bin/sh
cd /home/minecraft/nirrius-minecraft/Minecraft-Region-Fixer
python ./region-fixer.py --delete-entities --entity-limit=5 --dc ../mc-server/maps/$1

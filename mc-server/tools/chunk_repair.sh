#!/bin/sh
cd /home/minecraft/nirrius-minecraft/mc-server/Minecraft-Region-Fixer
python ./region-fixer.py
python ./region-fixer.py --delete-entities --entity-limit=5 --dc ../maps/$1
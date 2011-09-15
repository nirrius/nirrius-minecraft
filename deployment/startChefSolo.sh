#!/bin/sh
chef-solo -j /home/minecraft/nirrius-minecraft/deployment/chef/node.json -c /home/www-server/minecraft/deployment/chef/solo.rb


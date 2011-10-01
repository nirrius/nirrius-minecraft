#!/bin/bash
# Minecraft bootstrap: installs all requirements for a Minecraft Server.
# Must run as root.
# Used for clean server creation
# The script will fail without GitHub having the proper keys SSH key in root's .ssh directory.
while true; do
    read -p "Does this server have the Github SSH key copied to root's SSH directory?  (y/n) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "y or n";;
    esac
done

# Add www group and daemon users. Add to as needed.
groupadd www
useradd -m www-developer --home /home/www-developer --shell /bin/bash -g www -G minecraft
useradd -m www-server --home /home/www-server --shell /dev/null -g www
useradd -m minecraft --home /home/minecraft --shell /bin/bash -g minecraft -G www

echo "www-developer  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
cp -R /root/.ssh/ /home/www-developer/.ssh/
chown -R www-developer:www /home/www-developer/.ssh/

echo "minecraft  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Enable the multiverse. Used for Chef java cookbook.
sed -i -e "s/# deb/deb/g" /etc/apt/sources.list

# Install some useful stuff.
apt-get -yy update
apt-get -yy upgrade
apt-get -yy install wget screen zip unzip vim htop git build-essential

# Install Ruby packages
apt-get --yy install ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb irb1.8 ruby1.9.1 ruby1.9.1-dev
apt-get --yy install libreadline-ruby1.8 libruby1.8 libopenssl-ruby ssl-cert

# Install RubyGems from source or Ubuntu will disable updates and cause random issues.
cd /tmp
wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
tar zxf rubygems-1.8.10.tgz
cd rubygems-1.8.10
ruby setup.rb --no-format-executable

gem install rubygems-update
gem update --system

# Install Chef: This takes a few minutes.
gem install chef --no-ri --no-rdoc

cd /home/

#!/bin/bash

clear
echo "MKAS Parse Installer for Portainer"
echo "----------------------------------"
echo ""
read -p "What is the name of the directory you would like to install parse into? " direct
echo ""
echo " [NOTE] Creating directory /home/$direct"
mkdir /home/$direct
cd /home/$direct
echo " [NOTE] Installing Updating Server"
apt-get update && apt-get upgrade -y
clear
echo " [NOTE] Installing Nodesource"
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh
clear
echo " [NOTE] Installing support applications"
apt-get install -y nodejs build-essential git nano wget
clear
echo " [NOTE] Installing Database"
apt-get update
apt-get install -y mongodb --allow-unauthenticated
systemctl enable mongodb
clear
echo " [NOTE] Installing Parse Server"
npm install -g pm2
clear
echo " [*** ACTION REQUIRED ***] Please follow the onscreen instructions"
npm init
echo " [NOTE] Continuing Install"
npm install --save express parse-server parse-smtp-template
mkdir cloud
wget https://github.com/EnzoBitMatrix/parse-server-with-panel/blob/c514db86f612b788059f31e507a53a624e38c81b/parse-server/index.js
clear
echo " [MORE TO DO] We have done all we can. The rest is up to you."

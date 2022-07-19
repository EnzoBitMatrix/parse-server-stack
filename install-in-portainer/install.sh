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
echo " [NOTE] Installing support applications"
apt-get install -y git nano wget curl
clear
echo " [NOTE] Installing Nodesource"
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh
clear
echo " [NOTE] Installing support applications"
apt-get install -y nodejs build-essential
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
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/index.js
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/main.html
cd /home/$direct/node_modules/parse-smtp-template/templates
rm main.html
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/main.html
cd /home/$direct/cloud
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/cloud/main.js
clear
cd /home/$direct
echo " [MORE TO DO] We have done all we can. The rest is up to you."
echo ""
echo "[-] Created directories"
echo "[-] Updated and Upgraded APT"
echo "[-] Installed nano, wget, and CURL"
echo "[-] Installed Nodesource 16.x"
echo "[-] Installed NodeJS"
echo "[-] Installed Mongo Database"
echo "[-] Installed Parse Server and pm2"
echo ""
echo "*** NEXT STEPS ***"
echo "* Create Mondo DB user"
echo "* Edit index.js for Parse"
echo "* Run Parse Server"

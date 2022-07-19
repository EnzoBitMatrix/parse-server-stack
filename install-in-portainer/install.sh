#!/bin/bash

clear
echo "MKAS Parse Installer for Portainer"
echo "----------------------------------"
echo ""
read -p "What is the name of the directory you would like to install parse into? " direct
echo ""
echo "[MKAS] Creating directory /home/$direct"
mkdir /home/$direct >/dev/null
cd /home/$direct >/dev/null
echo ""
echo "[MKAS] Updating Server"
apt-get update && apt-get upgrade -y >/dev/null
echo ""
echo "[MKAS] Installing support applications"
apt-get install -y git nano wget curl systemctl apt-utils >/dev/null
echo ""
echo "[MKAS] Installing Nodesource"
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && bash nodesource_setup.sh >/dev/null
echo ""
echo "[MKAS] Installing NodeJS"
apt-get install -y nodejs build-essential >/dev/null
echo ""
echo "[MKAS] Installing Database"
apt-get update >/dev/null
apt-get install -y mongodb --allow-unauthenticated >/dev/null
systemctl enable mongodb >/dev/null
echo ""
echo "[MKAS] Installing Parse Server"
npm install -g pm2 >/dev/null
echo ""
echo "[*** ACTION REQUIRED ***] Please follow the onscreen instructions"
echo ""
npm init
clear
echo ""
echo " [NOTE] Continuing Install"
npm install --save express parse-server parse-smtp-template >/dev/null
mkdir cloud >/dev/null
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/index.js >/dev/null
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/main.html >/dev/null
cd /home/$direct/node_modules/parse-smtp-template/templates >/dev/null
rm main.html >/dev/null
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/main.html >/dev/null
cd /home/$direct/cloud >/dev/null
wget https://raw.githubusercontent.com/EnzoBitMatrix/parse-server-stack/main/install-in-portainer/cloud/main.js >/dev/null
clear
cd /home/$direct
echo "[MORE TO DO] We have done all we can. The rest is up to you."
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
echo "[*] Create Mondo DB user"
echo "[*] Edit index.js for Parse"
echo "[*] Run Parse Server"
echo ""
read -p "Press Enter to exit the installer " finished

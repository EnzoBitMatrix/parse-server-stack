#!/bin/bash

clear
echo "MKAS Parse Installer for Portainer"
echo "----------------------------------"
echo ""
read -p "What is the name of the directory you would like to install parse into? " direct
read -p "What is your Parse Application Name? " appName
read -p "What is your Parse Application ID? " appId
read -p "What is your Parse Master Key? " masterKey
read -p "What is your Parse Rest API Key? " restAPIKey
read -p "What is your Parse Server URL? eg https://api.domain.com:1337/parse " serverURL
read -p "What is your Public Server URL? eg https://api.domain.com" publicServerURL
read -p "What is your SMTP Host? " SMTP_HOST
read -p "What is your SMTP Password? " SMTP_PASS
read -p "What is your SMTP User? " SMTP_USER
read -p "What is your Email From Name? " FROM_NAME
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
clear
echo " [NOTE] Configuring Parse"
echo 'const express = require('express');' >> index.js
echo 'const ParseServer = require('parse-server').ParseServer;' >> index.js
echo 'const app = express();' >> index.js
echo 'const fs = require('fs');' >> index.js
echo 'const port = 1337;' >> index.js
echo 'const api = new ParseServer({' >> index.js
echo '    appName: '$appName',' >> index.js
echo '    databaseURI: 'mongodb://admin:password@localhost:27017/admin',' >> index.js
echo '    appId: '$appId',' >> index.js
clear
echo " [MORE TO DO] We have done all we can. The rest is up to you."

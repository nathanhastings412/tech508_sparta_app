#!/bin/bash

# update and upgrade packages
echo =============================
echo "update and upgrade packages"
echo =============================
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
echo "done"
echo

# install gnupg and curl
echo ========================
echo "install gnupg and curl"
echo ========================
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y gnupg curl
echo "done"
echo 

# import mongoDB public GBG key
echo ================
echo "import mongodb"
echo ================
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor --yes
echo "done"
echo

# create the list file
echo =============
echo "create list"
echo =============
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "done"
echo

# Reload package database
echo =========================
echo "reload package database"
echo =========================
sudo DEBIAN_FRONTEND=noninteractive apt-get update
echo "done"
echo

# install mongoDB community server FIX!
echo ==================================
echo "install mongoDB community server"
echo ==================================
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22
echo "done"
echo

# backup existing config
echo ===============
echo "backup config"
echo ===============
sudo cp /etc/mongod.conf /etc/mongod.conf.bak
echo "done"
echo

# change bind ip
# use sed change bindIp to 0.0.0.0 in /etc/mongod.conf
echo =====================
echo "Reconfigure bind ip"
echo =====================
sudo sed -i 's/^\s*bindIp:\s*127\.0\.0\.1/  bindIp: 0.0.0.0/' /etc/mongod.conf
echo "Bind IP set to 0.0.0.0"
echo

echo ===========================
echo "start and enable database"
echo ===========================
sudo systemctl start mongod
sudo systemctl enable mongod

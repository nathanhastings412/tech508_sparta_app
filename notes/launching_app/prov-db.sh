#!/bin/bash

# update packages
echo "update..."
sudo apt-get update
echo "done"
echo


# upgrade packages
echo "upgrade..."
sudo apt upgrade -y
echo "done"
echo

# install gnupg and curl
echo "install gnupg and curl"
sudo apt-get install gnupg curl
echo "done"
echo 



# import mongoDB public GBG key
echo "import mongodb"
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "done"
echo

# create the list file
echo "create list"
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo "done"
echo

# Reload package database
echo "reload package database"
sudo apt-get update
echo "done"
echo

# install mongoDB community server FIX!
echo "install mongoDB community server"
sudo apt-get install -y \
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

# change bind ip
# use sed change bindIp to 0.0.0.0 in /etc/mongod.conf

sudo systemctl start mongod

sudo systemctl enable mongod

#!/bin/bash
# provision sparta test app
echo =============================
echo "update and upgrade packages"
echo =============================
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
echo "done"
echo

# FIX
echo ===============
echo "install nginx"
echo ===============
sudo apt-get install nginx -y
echo "done"
echo

# configure reverse proxy using nginx

# installing NodeJS v20 (installs node and npm commands)
echo ====================
echo "install NodeJS v20"
echo ====================
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "done"
echo 

# verify nodejs version
echo ==============
echo "node version"
echo ==============
node -v
echo done 
echo

# download app code
echo ===================
echo "download app code"
echo ===================
git clone https://github.com/nathanhastings412/tech508_sparta_app repo
echo "done"
echo

# cd into app folder
echo ====================
echo "cd into app folder"
echo ====================
cd repo/app
echo "done"
echo

# set env var for connection to database
# comment this out
echo ======================================
echo "set connection for database variable"
echo ======================================
export DB_HOST=mongodb://172.31.25.124:27017/posts
echo "done"
echo

# install packages for app
echo ======================
echo "install app packages"
echo ======================
npm install
echo "done"
echo

# start app
echo ===========
echo "start app"
echo ===========
npm start
echo "done"





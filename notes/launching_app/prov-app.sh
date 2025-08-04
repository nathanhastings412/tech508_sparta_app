#!/bin/bash
# provision sparta test app

echo "update..."
sudo apt-get update
echo "done"
echo


# FIX
echo "upgrade..."
sudo apt upgtrade -y
echo "done"
echo

# FIX
echo "install niginx"
sudo apt-get install nginx -y
echo "done"
echo

# configure reverse proxy using nginx

# installing NodeJS v20 (installs node and npm commands)

echo "install NodeJS v20"
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "done"
echo 

# verify nodejs version
echo "node version"
node -v
echo 

# download app code
echo "download app code"
git clone https://github.com/nathanhastings412/tech508_sparta_app repo
echo "done"
echo

# cd into app folder
echo "cd into app folder"
cd repo/app
echo "done"
echo

# set env var for connection to database
# comment this out
echo "set connection for database variable"
export DB_HOST=mongodb://172.31.25.124:27017/posts
echo "done"
echo

# install packages for app
echo "install app packages"
npm install
echo "done"
echo

# start app
echo "start app"
npm start
echo "done"





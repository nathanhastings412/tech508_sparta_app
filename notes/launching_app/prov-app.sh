#!/bin/bash
# provision sparta test app
echo =============================
echo "update and upgrade packages"
echo =============================
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
echo "done"
echo

# install nginx
echo ===============
echo "install nginx"
echo ===============
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo "done"
echo

# Replace try_files with proxy_pass in nginx config
echo =================================
echo "Configuring Nginx reverse proxy"
echo =================================
sudo sed -i '/try_files/s|try_files .*;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
echo "nginx reverse proxy configured"
echo

# Restart nginx
echo ================
echo "Restarting Nginx"
echo ================
sudo systemctl restart nginx
echo "done"

# installing NodeJS v20 (installs node and npm commands)
echo ====================
echo "install NodeJS v20"
echo ====================
sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo "done"
echo 

# verify nodejs and npm version
echo ======================
echo "node and npm version"
echo ======================
node -v
npm -v
echo "done" 
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

# install pm2
echo =============
echo "install pm2"
echo =============
sudo npm install -g pm2
echo "done"
echo

# set env var for connection to database
# comment this out for no DB connection
echo ======================================
echo "set connection for database variable"
echo ======================================
export DB_HOST=mongodb://<privateipdb>:27017/posts
echo "done"
echo

# install packages for app
# also seeds the database when you rerun it
echo ======================
echo "install app packages"
echo ======================
# npm install
echo "done"
echo

# install packages for app
echo ================================
echo "clean and install app packages"
echo ================================
rm -rf node_modules package-lock.json  # clean previous install
if [ ! -f package.json ]; then
  echo "ERROR: package.json not found!"
  exit 1
fi

npm install || { echo "npm install failed"; exit 1; }
echo "npm install completed successfully"
echo


# start app
echo ===========
echo "start app"
echo ===========
# nohup npm start &
echo "done"

# start app in background
echo ===========
echo "start app"
echo ===========
pm2 kill
pm2 start npm --name "my-app" -- start
pm2 save
echo "done"


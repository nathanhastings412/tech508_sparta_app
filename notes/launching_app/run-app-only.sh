#!/bin/bash


echo ======================================
echo "set connection for database variable"
echo ======================================
export DB_HOST=mongodb://<privateipdb>:27017/posts
echo "done"
echo

echo ====================
echo "cd into app folder"
echo ====================
cd repo/app
echo "done"
echo

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

echo ==========
echo "start app"
echo ==========
pm2 stop all
pm2 start app.js
pm2 save
echo "done"
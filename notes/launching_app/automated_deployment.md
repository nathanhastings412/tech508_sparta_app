## automated deployment of app on EC2 instance

### Create repo
1. Download and unzip the zip folder
2. cut the app folder
3. paste inside a new git repository folder "tech508_sparta_app"
4. create a new github repo by the same name

in gitbash:
- cd into tech508_sparta_app
- `git init`
- `git status`
- `git add .`
- `git commit -m ""`
- `git branch -M main`
- `git remote add origion <url>`
- `git push -u origin main`

- confirm you can see app folder in github

### launch instance
- name convention includes some sort of indication as to the environment - test or prod
- ubuntu server 22.04 LTS
- t3.micro
- security
  - allow http
  - allow TCP 3000 from anywhere

### Front end

#!/bin/bash
- provision sparta test app

update
- `sudo apt-get update`

upgrade
- `sudo apt upgtrade -y`

install nginx
- `sudo apt-get install nginx -y`

- configure reverse proxy using nginx

installing NodeJS v20 (installs node and npm commands)
- `sudo DEBIAN_FRONTEND=noninteractive bash -c "curl -fsSL https://deb.nodesource.com/setup_20.x | bash -" && \sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs`

- verify nodejs version
  - `node -v`

- download app code
  - github repo > code > copy path
  - `git clone https://github.com/nathanhastings412/tech508_sparta_app repo`
  - can remove the .git and add " repo" to copy into a new folder called repo

- cd into app folder
  - `cd repo/app`

- set env var for connection to database
  - export DB_HOST=mongodb://<privateipdb>:27017/posts

- install packages for app
  - `npm install`

- start app
  - `npm start`

### Database

create instance
- AMI ubuntu 22.04
- t3.micro
- security
  - ssh
  - customTCP 27017 from anywhere (mongodb)
- ssh in


- update and upgrade
  - `sudo apt-get udpate`
  - `sudo apt upgrade -y`
- install gnupg and curl
  - `sudo apt-get install gnupg curl`
- import mongoDB public GBG key
  - `curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc |    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg    --dearmor`
- Create list file
  - `echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list`
- reload package database
  - `sudo apt-get update`
- install mongoDB community server FIX!
  - `sudo apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22`
- check status of mongo
  - `sudo systemctl status mongod`
- cd into etc folder
  - `cd /etc`
  - `ls`
- edit text of mongo.conf after making backup
  - `sudo cp mongo.conf mongo.conf.bk`
  - `sudo nano mongo.conf`
- edit bindip from 127.0.0.1 to 0.0.0.0
- start and enable mongodb
  - `sudo systemctl start mongod`
  - `sudo systemctl enable mongod`
  - status check
- set variable in frontend vm
  - `export DB_HOST=mongodb://<privateipdb>:27017/posts`
- refresh npm install
  - `npm install`
- start npm
  - `npm start`
  - 
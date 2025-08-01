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

### setting up script

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

- install packages for app
  - `npm install`

- start app
  - `npm start`



# Revision



### avoid single point of failure
- single point of failure is when something goes wrong when you run on one single machine
- instead you can run on multiple machines
- split machines across different zones
- multiple instances can divide traffic (not inherentely a solution for this)
- multi cloud provider
- hybrid setup


### security group rules for app/database vms
- naming convention
- allow ssh, http, 3000, 5000, or specific db port (only necessary traffic)
- t3.micro
  - low cost, general purpose, burstable performance

### process to get /posts page working
- check that app vm can connect to database vm via the environment variable you set
- change mongoDB bindip to allow remote connections
- start mongo
- make sure db ec2 security group allows incoming traffic from the app ec2
- pm2 start
- make sure app vm security group allows web traffic
- visit /posts

### how to automate reverse proxy configuration
- edit nginx config file after creating a backup
- sudo sed string replace text with text

### how to make nodejs app run in background
- &
  - if you close terminal or sessions ends, the app will stop
- pm2
  - app runs even if you close terminal
  - automatically restarts app if it crashes

### understand bindip of database
- the network interface the database server listens on for incoming connections
- tells the database which IP addresses to accept connections from
- usually want to allow the specific machines ip addresses public or private

### how to get sparta app and database to connect to each other
- database listens on correct IP
  - bindip 0.0.0.0
- AWS security groups allow communication
- app uses database's private ip in its connection string
- start app with the correct config (env var)
- 

### applying configuration changes to mongo db
- cd /etc
- sudo nano mongo.conf

### understanding AMIs in AWS
- Amazon machine image
- snapshot or template of a vm
- includes:
  - os
  - optional pre-installed software
  - custom settings/configs
- use AMIs to
  - create exact copies of a configured instance
  - back up a working system
  - launch auto-scaled EC2s from the same setup
  - restore a crashed instance quickly
- Different from snapshots
  - AMIs include OS and used to launch
  - snapshots do not include OS and used for EBS restore

### How AMIs help a business
- fast recovery from failures
  - if a server crashes you can launch a new instance in minutes
  - minimal downtime
- consistent deployments
  - every new server launched is identical
  - avoids "it works in my machine" problems
- Auto scaling and load balancing
  - in a scalable web app setup:
  - when traffic increases, AWS can automatically launch more instances from your AMI
  - handle more users without manual setup
- Saves setup time
- testing and experimentation
- Compliance and security

### how user data runs
- from the root directory
- scripts have to be made from that perspective
- Make sure to change the ip for the env variable

### why use user data
- you can access the website without even logging into the machine
- less human error
- can only be done once

### ports to traffic related sparta app
- http 80 - web traffic
- 

### monoliths vs n tier architecture - differences and pros/cons
- monolith is one machine
  - simple to develop and deploy initially
  - easier debugging
  - less overhead
  - good for small apps or mvps
- however:
  - hard to scale individual components
  - tightly coupled: a change in one part affects the whole
  - slower deployments as app grows
  - harder to adopt new technologies
- n tier is n number of machines 
  - separation of concerns makes code cleaner and more maintainable
  - can scale individual layers
  - easier to update or replace individual components
  - better for large, complex systems
- however:
  - more complex to set up and manage
  - increased latency due to communication between layers
  - requires more infrastructure/configuration
  - higher learning curve for beginners


### troubleshooting the running of the sparta app
- check status of mongod
- check pm2 logs
- `sudo nano /var/log/cloud-init-output.log`

### installing dependencies for the sparta app
- install node js
- navigate to frontend
- npm install
  - installs packages from packages.json file


### ways to get app code onto a cloud instance
- git clone 
- scp 

### why use pm2
- manages processes much more easily (particularly stopping the process)
- keep app running
- run app in background
- monitoring and logs 


NOTES: 
- 502 bad gateway error
  - cannot connect to the app that is running on port 3000


What is the diff between security group and NACL? 
- SG is stateful, per instance
- NACL is stateless, per subnet

What is a VPC? 
- virtual private cloud
- it is an isolated private network inside the aws cloud
- you can control ip ranges, suinmets, routing control, security, connectivity

How to did you secure your app on AWS? 
- public subnet for app
- private subnet for db
- dm did not have public ip and did not allow ssh in

How do you set up monitoring on AWS? 
- 

What is Cloudwatch? 
- 

What is auto-scaling? 
- automatically adjusts the number of running compute resources based on demand


What is scaling up/down? 
- scaling up - add more resources to existing resource
- scaling down - decrease power of existing resource

How is it different to scaling in/out? 
- scaling out - add more resources of same type
- scaling in - remove extra resources

Who are some of the other large Cloud providers? 

What is SSH? How does it work? 

Are there any best practices to follow when using AWS? 

Have you used AWS CLI? If so, to do what? 

What is a CIDR block? 
- is a way of writing an ip address together with the size of its network using the format <ip address/prefix length>

What is a load balancer? 
- a system that distributes incoming network traffic across multiple servers so no single server is overwhelmed

How can you monitor the CPU utilisation of your VM? 
- cloudwatch

What is a better solution than monitoring a dashboard?  Why? 
- automated alerts do not rely on human monitoring which can be prone to error

What is a better solution than setting an automated alert? Why? 
- auto scaling

What are the types of scaling? 
- horizontal and vertical

What is VM autoscaling? 

What type of scaling is involved? 
- horizontal 

How do I setup an app on AWS with HA and SC? 
- multiple availability zones
- load balancer
- set parameters for minimum, desired, and maximum number of vms to cater for scaleability

What does not get specified in our launch template and why? 
- name tag
- availability zones


Why do we not need to specify the virtual network for our VMs up until now? 
- default network when we set vms up

Why do we not start with a base image (Marketplace image) for the Launch Template to use for our app instance? 
- we create launch template from our AMI not from base image

Besides HA and SC, what are some extra factors you need to take into account? How would you factor them in? 
- set an appropriate warm up time
- scaling cooldown periods
- health checks

What is a Target Group, what is it used by and why? 


Explain the mindset needed when setting up HA + SC on AWS 
- assume failure to an extent with the intent of accommodating that failure
- 
 

Securing the database on AWS in a 2-tier app deployment 

Why secure the database? 
- protect sensitive data
- if compromised, you dont want attacker to have unlimited access

What makes the database less secure in the current 2-tier app deployment?
- bindip set to accepts traffic from anywhere
- can be ssh'd into
- has a public ip (public access)

What should be able to access the database? What shouldn't? 
- the public subnet (app vm) should be able to access the database
- public access to the database should not be allowed

What is the advantage in using a custom VPC over the default VPC? 
- you can design the architecture and the routes with which traffic is allowed in and where it will go (you control what is accessible to whom)

What is not allowed in a custom VPC by default? 
- associated subnet (people are not allowed to access the app from the outside)

What is allowed in a custom VPC by default? 

In the custom VPC, why do you need to use the database AMI to get the database working? 

What is the order in which you need to create your custom VPC app architecture? Why? 

Why do we need a public route table? 

What does the public route table need to be explicitly associated with? Why? 

What must be included in the route setup in the public route table? Why? 

What makes the private subnet "private"? 

What makes the public subnet "public"? 

With the way we setup the custom VPC, how can you SSH into the database VM? 


Why do we need to secure the database?
- need to keep the data secure


what is it that makes the database less secure from before?
- could ssh in
- could be accessed directly

what should be the only thing that can access the database?
- the app

Why use a custom vpc instead of the default?
- we can design the architecture 
- we can control who has access

what is not allowed in a custom vpc by default?
- subnet association (people being able to access the app from the outside)

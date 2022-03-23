#!/bin/bash 

######################################################

# this script is for spinning up apache2 at boot time 
# on an ec2 instance running Amazon Linux 2 x86 64 bit
# it is intended to be deployed in the user data field

# if you're wondering why sudo is absent it's because
# the user data is executed by root

######################################################

# get admin privileges 
sudo su 

# install httpd (Linux 2 version) 
yum update -y  
yum install -y httpd.x86_64 
systemctl start httpd.service 
systemctl enable httpd.service 
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
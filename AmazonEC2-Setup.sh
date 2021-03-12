#!/bin/bash
UNAMEX="ec2-user"
sudo yum update -y
sudo yum install docker -y
sudo yum install git -y
sudo service docker start
sudo usermod -a -G docker $UNAMEX
cd /home/$UNAMEX

# clone master branch
git clone https://github.com/PSUCompBio/simple-nodejs-app.git
cd simple-nodejs-app
sudo docker build  --build-arg UNAMEX=ec2-user -t nodetest .
cd /home/$UNAMEX
sudo chown -R $UNAMEX \*

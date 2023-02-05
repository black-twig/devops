#! /bin/bash

#script to install Docker Engine with Jenkins server on Ubuntu

#0. clean up possible existing installiations
sudo apt-get remove docker docker-engine docker.io

#1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

#2. Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

#3. Set up the repository:
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

#4. Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce containerd.io  -y

#5.  create docker group to allow non-root usage with user (no sudo)
    # "ubuntu" is an user name for the Ubuntu AWS AMIs
sudo groupadd docker 
sudo usermod -a -G docker "ubuntu"

# Reload a Linux user's group assignments to docker w/o logout
newgrp docker

#6. Configure Docker to start on boot with system
sudo systemctl enable docker
sudo systemctl enable containerd

#7. install jenkins server (the latest LTS)
sudo docker pull jenkins/jenkins:lts-jdk11

sudo docker run --name jenkinscontainer -dit -p 80:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk11

#sudo docker exec jenkinscontainer cat /var/jenkins_home/secrets/initialAdminPassword



#!/bin/bash
sudo DEBIAN_FRONTEND=noninteractive bash -c "
apt update -y
apt upgrade -y
apt install git -y
apt install gh -y
apt install docker.io -y
apt install java-latest-openjdk -y
wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update -y
apt install jenkins -y
apt install awscli


#Now we have installed all the required packages and services we will start the service

#Docker

systemctl enable docker.service
systemctl start docker.service

#Jenkins

systemctl enable jenkins.service
systemctl start jenkins.service

# Check and print the status of Docker service

echo "Docker Service Status:"
systemctl status docker.service

# Check and print the status of Jenkins service

echo "Jenkins Service Status:"
systemctl status jenkins.service

#adding custom commands for docker services

alias dstatus="systemctl status docker.service"
alias dstart="systemctl start docker.service"
alias denable="systemctl enable docker.service"
alias dstop="systemctl stop docker.service"
alias drestart="systemctl restart docker.service"

#adding custom commands for jenkins services

alias jstatus="systemctl status jenkins.service"
alias jstart="systemctl start jenkins.service"
alias jenable="systemctl enable jenkins.service"
alias jstop="systemctl stop jenkins.service"
alias jrestart="systemctl restart jenkins.service"

#adding a new user Mike

useradd -m -d /home/Mike -s /bin/bash Mike 

#adding user to sudo group

usermod -aG wheel 'Mike'

#adding Jenkins and docker to user group for safety to prevent any errors while running commands

usermod -aG jenkins '$USER'
usermod -aG docker '$USER'

#adding the jenkins to docker group for Jenkins to use docker services with all privilages

usermod -aG docker 'jenkins'
"

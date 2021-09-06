#!/usr/bin/bash

BRANCHNAME=develop

#stop the docker container for this service
sudo docker rm -f luther-sales-salesrep-app_container

#Remove the existing the images
sudo docker rmi luther-sales-salesrep-app

# Clone the repository
cd ~/new_paywallet_frontend_services/luther-sales-salesrep-app

# Pull the latest code from git
git pull

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

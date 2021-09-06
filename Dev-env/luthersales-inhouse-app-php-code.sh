#!/usr/bin/bash

BRANCHNAME=develop

#stop the docker container for this service
sudo docker rm -f luthersales-inhouse-app-php-code_container

#Remove the existing the images
sudo docker rmi luthersales-inhouse-app-php-code

# Clone the repository
cd ~/new_paywallet_frontend_services/luthersales-inhouse-app-php-code

# Pull the latest code from git
git pull

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

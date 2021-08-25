#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f payroll-provider-service_container

#Remove the existing the images
sudo docker rmi payroll-provider-service

# Clone the repository
cd new_paywallet_backend_services/payroll-provider-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

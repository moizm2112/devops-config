#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f order-management-service_container

sleep 30

#Remove the existing the images
sudo docker rmi order-management-service

# Clone the repository
cd ~/new_paywallet_backend_services/order-management-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generate Sonar Report
sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-Order-Service-API -Dsonar.host.url=http://35.209.16.103:9000 -Dsonar.login=11f49e0549ef52f75442dc9c2762b7d89db4c76e

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

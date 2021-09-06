#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f accounts-management-service_container

#Remove the existing the images
sudo docker rmi accounts-management-service

# Clone the repository
cd new_paywallet_backend_services/accounts-management-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generating Sonar Report
sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-AccountManagement-API -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 -Dsonar.login=11228d1e1a9bae1f3ce56cd0dcfea09835ea6bd8

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

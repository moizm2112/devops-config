#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f accounts-management-service_container

#Remove the existing the images
sudo docker rmi accounts-management-service

# Clone the repository
cd ~/new_paywallet_backend_services/accounts-management-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generating Sonar Report
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-UAT-AccountManagement-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 \
  -Dsonar.login=85202c46000da8b911cae32f8ebe661224b49974 \
  -Dsonar.name=UAT-accountmanagement-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

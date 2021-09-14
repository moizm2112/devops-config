#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f verification-link-service_container

#Remove the existing the images
sudo docker rmi verification-link-service

# Clone the repository
cd ~/new_paywallet_backend_services/verification-link-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generate Sonar Report
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-UAT-Verification_Link-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 \
  -Dsonar.login=38a14cc0c30653c1d44d90091f40c2c2581ad37c \
  -Dsonar.name=UAT-verification-link-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

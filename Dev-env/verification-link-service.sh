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
#sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-Verification_Link-API -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 -Dsonar.login=c2dad734282b8d8196b4c44d5826022fbef687df
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-Verification_Link-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000  \
  -Dsonar.login=c2dad734282b8d8196b4c44d5826022fbef687df \
  -Dsonar.name=Dev-verification-link-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

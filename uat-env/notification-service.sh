#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f notification-service_container

#Remove the existing the images
sudo docker rmi notification-service

# Clone the repository
cd ~/new_paywallet_backend_services/notification-service/

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generating Sonar Report
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-UAT-Notification-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 \
  -Dsonar.login=56faad5fef70ba10e8368749c4011e189f8f9a90 \
  -Dsonar.name=UAT-notification-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

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
#sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-Notification-API -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 -Dsonar.login=85ffcee11c519655c5cb33192d0c2e4d83ae7758
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-Notification-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000  \
  -Dsonar.login=85ffcee11c519655c5cb33192d0c2e4d83ae7758 \
  -Dsonar.name=Dev-notification-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

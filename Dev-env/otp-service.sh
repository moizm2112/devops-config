#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f otp-service_container

sleep 30

#Remove the existing the images
sudo docker rmi otp-service

# Clone the repository
cd new_paywallet_backend_services/otp-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generating Sonar Report
sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-Otp-API -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 -Dsonar.login=51598bd92e720ff8cd05cfc8903e58f25e24382c

# docker buil and update
sudo docker-compose -f docker-compose.yml up --build -d

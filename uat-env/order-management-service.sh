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
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-UAT-Order-Service-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 \
  -Dsonar.login=77e663375d0dc4f863152193d6b60c976d3a83cb \
  -Dsonar.name=UAT-order-management-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

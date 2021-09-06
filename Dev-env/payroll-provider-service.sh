#!/usr/bin/bash

BRANCHNAME=temp-develop

#stop the docker container for this service
sudo docker rm -f payroll-provider-service_container

#Remove the existing the images
sudo docker rmi payroll-provider-service

# Clone the repository
cd ~/new_paywallet_backend_services/payroll-provider-service

# Pull the latest code from git
git pull

#Remove the target folder and build new images
sudo mvn clean install -DskipTests

#Generate Sonar Report
sudo mvn sonar:sonar -Dsonar.projectKey=PayWallet-Payroll_Provider-API -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 -Dsonar.login=a3b5257195609b9dfea1e1906729d00e1a876c79

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

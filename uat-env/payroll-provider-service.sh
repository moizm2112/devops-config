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
mvn sonar:sonar \
  -Dsonar.projectKey=PayWallet-UAT-Payroll_Provider-API \
  -Dsonar.host.url=http://sonar-dev.paywalletllc.com:9000 \
  -Dsonar.login=045d3e4a4208f9109f557cb28415b24bad272f99 \
  -Dsonar.name=UAT-payroll-provider-service

# docker buil and update
sudo docker-compose -f docker-compose.yml up -d

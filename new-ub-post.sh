#!/bin/bash
echo "START"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "#################################################################################################"
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "#################################################################################################"
#тестові дії
docker run hello-world
docker run -it --rm -d -p 8080:80 --name nginx nginx
docker run -it --rm -d -p 8081:80 --name web nginx
docker ps
docker images
docker rmi hello-world:latest nginx:latest -f
echo "END"
#!/bin/bash
echo "Skript start"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update > hw2.txt 2>&1
sudo apt-get install ca-certificates curl >> hw2.txt 2>&1
sudo install -m 0755 -d /etc/apt/keyrings >> hw2.txt 2>&1
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc >> hw2.txt 2>&1
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "#################################################################################################"
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null >> hw2.txt 2>&1
sudo apt-get update >> hw2.txt 2>&1
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> hw2.txt 2>&1

echo "#################################################################################################"
#Налаштування групи для поточного користувача
sudo usermod -aG docker $USER >> hw2.txt 2>&1
newgrp docker >> hw2.txt 2>&1
sudo groupadd docker >> hw2.txt 2>&1

echo "#################################################################################################"
#тестові дії
docker run hello-world >> hw2.txt 2>&1
docker run -it --rm -d -p 8080:80 --name nginx nginx >> hw2.txt 2>&1
docker run -it --rm -d -p 8081:80 --name web nginx >> hw2.txt 2>&1
docker ps >> hw2.txt 2>&1
docker images >> hw2.txt 2>&1
docker rmi hello-world:latest nginx:latest -f >> hw2.txt 2>&1
echo "Skript END"
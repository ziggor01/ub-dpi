#!/bin/bash
echo "START"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update
sudo apt -y install mc curl snap
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

# echo "#################################################################################################"

 sudo groupadd docker
 sudo usermod -aG docker ${USER}
 newgrp docker

# echo "#################################################################################################"

# sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
# sudo chmod g+rwx "$HOME/.docker" -R




echo "#################################################################################################"
#тестові дії
# sudo docker run hello-world
# sudo docker run -it --rm -d -p 8080:80 --name nginx nginx
# sudo docker run -it --rm -d -p 8081:80 --name web nginx
# sudo docker ps
# sudo docker images
# sudo docker rmi hello-world:latest nginx:latest -f
echo "END"
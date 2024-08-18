#!/bin/bash

if [ "$1" != "second-part" ]; then
    echo "Skript start"
    echo "#################################################################################################"
    # Оновлення + встановлення згідно інструкції на офіційному сайті
    sudo apt -y update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "#################################################################################################"
    # Додавання репозиторію в джерела Apt
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    echo "#################################################################################################"
    # Налаштування групи для поточного користувача
    sudo groupadd docker
    sudo usermod -aG docker $USER

    echo "#################################################################################################"
    echo "Перезапуск скрипта в новому сеансі з активною групою docker..."
    exec sg docker "$0 second-part"
else
    echo "#################################################################################################"
    # Тестові дії
    echo "Запуск тестових команд Docker..."
    docker run hello-world
    docker run -it --rm -d -p 8080:80 --name nginx nginx
    docker run -it --rm -d -p 8081:80 --name web nginx
    docker ps
    docker images
    docker rmi hello-world:latest nginx:latest -f
    echo "Skript END"
fi
#!/bin/bash
echo "START"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update
sudo apt install -y mc curl snap apt-transport-https
url -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
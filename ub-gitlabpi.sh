#!/bin/bash
echo "START"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update
sudo apt install -y curl openssh-server ca-certificates tzdata perl
sudo apt-get install -y postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

sudo swapoff -a

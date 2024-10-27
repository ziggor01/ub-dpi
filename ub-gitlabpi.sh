#!/bin/bash
echo "START"
#Оновлення + встановлення знідно інструкції на офф сайті
sudo apt -y update
sudo apt install -y curl openssh-server ca-certificates tzdata perl
sudo apt-get install -y postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# Встановіть новий пароль для root
NEW_PASSWORD="Pass12345"

# Скидання пароля
echo -e "$NEW_PASSWORD\n$NEW_PASSWORD" | sudo gitlab-rake "gitlab:password:reset[root]"

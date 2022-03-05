#!/bin/bash

#install gitlab
sudo apt update
sudo apt upgrade -y
sudo snap install btop
sudo apt install -y curl openssh-server ca-certificates tzdata perl
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://127.0.0.1" GITLAB_ROOT_PASSWORD="sbercloud" apt-get install gitlab-ee
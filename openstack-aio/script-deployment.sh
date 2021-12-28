#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo snap install btop
sudo apt install -y build-essential git chrony openssh-server python3-dev
git clone -b 24.0.0.0rc1 https://github.com/openstack/openstack-ansible.git /opt/openstack-ansible

/opt/openstack-ansible/scripts/bootstrap-ansible.sh
/opt/openstack-ansible/scripts/bootstrap-aio.sh

cp /opt/openstack-ansible/etc/openstack_deploy/conf.d/{aodh,gnocchi,ceilometer}.yml.aio /etc/openstack_deploy/conf.d/
for f in $(ls -1 /etc/openstack_deploy/conf.d/*.aio); do mv -v ${f} ${f%.*}; done

openstack-ansible /opt/openstack-ansible/playbooks/setup-hosts.yml
openstack-ansible /opt/openstack-ansible/playbooks/setup-infrastructure.yml
openstack-ansible /opt/openstack-ansible/playbooks/setup-openstack.yml

openstack-ansible -e galera_ignore_cluster_state=true /opt/openstack-ansible/playbooks/galera-install.yml
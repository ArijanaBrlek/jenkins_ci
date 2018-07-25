#!/bin/bash

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm

yum -y update
yum clean all

yum -y install python36u python36u-pip git rpm-build

ln -s /usr/bin/python3.6 /usr/bin/python3

yum -y install openssh-server
systemctl enable sshd.service
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
passwd -d root
./usr/sbin/sshd -f /etc/ssh/sshd_config

yum -y install vim

yum -y update
yum clean all
rm -rf /var/cache/yum

pip3.6 install gitpython pytest pylint

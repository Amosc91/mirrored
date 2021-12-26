#!/bin/bash
#add fix to exercise5-server1 here
sudo sed -i '$ a 192.168.100.10 server1 server1' /etc/hosts
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh
sudo su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
mkdir -p /vagrant/nfs/ssh
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/nfs/ssh/server1.pub
sudo su
ssh-keyscan -t rsa server1 > /etc/ssh/ssh_known_hosts
ssh-keyscan -t dsa server1 >> /etc/ssh/ssh_known_hosts
sleep 20
ssh-keyscan -t rsa server2 >> /etc/ssh/ssh_known_hosts
ssh-keyscan -t dsa server2 >> /etc/ssh/ssh_known_hosts
cat /vagrant/nfs/ssh/server2.pub >> /home/vagrant/.ssh/authorized_keys
cat /vagrant/nfs/ssh/server1.pub >> /home/vagrant/.ssh/authorized_keys

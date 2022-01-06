#!/bin/bash
#add fix to exercise5-server1 here
sudo -- sh -c -e "echo '192.168.100.10 server1' >> /etc/hosts";
sudo su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
echo 'Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null' > /home/vagrant/.ssh/config
mkdir -p /vagrant/nfs/ssh
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/nfs/ssh/server1.pub
ssh-keyscan -t rsa server1 >> /etc/ssh/ssh_known_hosts
ssh-keyscan -t rsa server2 >> /etc/ssh/ssh_known_hosts
cat /vagrant/nfs/ssh/server2.pub >> /home/vagrant/.ssh/authorized_keys
cat /vagrant/nfs/ssh/server1.pub >> /home/vagrant/.ssh/authorized_keys

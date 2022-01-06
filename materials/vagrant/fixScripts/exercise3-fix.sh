#!/bin/bash
#add fix to exercise3 here
sudo sed -i "s/Require all denied/Require all granted/g" /etc/apache2/sites-enabled/000-default.conf
sudo /etc/init.d/apache2 restart

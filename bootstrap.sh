#!/usr/bin/env bash

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

#### install build-essential
sudo apt-get update
sudo apt-get install linux-headers-$(uname -r) build-essential

#### install mysql server
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password HelloLamp'
sudo debconf-set-selections <<< 'mysql-server-<version> mysql-server/root_password_again password HelloLamp'
sudo apt-get -q -y install mysql-server-5.5

#### install apache2
sudo apt-get -y -q install apache2
sudo apt-get -y -q install php5=5.4.9-4ubuntu2.3

#### install phpmyadmin
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean false'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password HelloLamp'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password HelloLamp'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password HelloLamp'
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -q -y install phpmyadmin

rm -rf /var/www
ln -fs /vagrant/public_html /var/www

#!/bin/bash

# Adding ppa repositories
add-apt-repository ppa:git-core/ppa

# Installing Ubuntu build dependencies
curl -sL https://deb.nodesource.com/setup_0.12 | bash -
apt-get install -y nodejs git build-essential automake python-dev

# Installing Samba
apt-get install -y samba samba-common python-glade2 system-config-samba

# Install ember-cli and bower
npm install -g ember-cli bower

# Install watchman
git clone https://github.com/facebook/watchman.git /opt/watchman
cd /opt/watchman
./autogen.sh
./configure
make
make install
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Setting up Samba
share=/samba/ember-workspace
mkdir -p $share
chmod -R 0755 $share
chown -R vagrant:vagrant $share

mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
mv /home/vagrant/smb.conf /etc/samba/smb.conf

smb_password=vagrant
(echo $smb_password; echo $smb_password) | smbpasswd -a vagrant

service smbd restart

# Setting up local workspace
ln -s /samba/ember-workspace /home/vagrant/ember-workspace
chown -h vagrant:vagrant /home/vagrant/ember-workspace

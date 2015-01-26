#!/bin/bash

# Adding ppa repositories
add-apt-repository ppa:git-core/ppa

# Installing Node.js
curl -sL https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs build-essential

# Installing Git
apt-get install -y git

# Installing Samba
apt-get install -y samba samba-common python-glade2 system-config-samba

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

# TODO: Install ember-cli

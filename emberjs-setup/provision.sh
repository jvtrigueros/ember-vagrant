#!/bin/bash

# Adding ppa repositories
sudo add-apt-repository ppa:git-core/ppa

# Installing Node.js
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs build-essential

# Installing Git
sudo apt-get install -y git

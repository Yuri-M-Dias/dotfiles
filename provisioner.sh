#!/bin/sh

echo 'Adding necessary repositories'
sudo apt-add-repository ppa:fish-shell/release-2

echo 'Updating and installing packages'
sudo apt-get update
sudo apt-get install curl fish \
	wget

echo 'Installing oh-my-fish'
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# Docker

# Vagrant

# Programming languages

# Both pythons with PyPi and Virtualenv

echo 'Installing RVM with Rails'
curl -sSL https://get.rvm.io | bash -s stable --rails

echo 'Installing NVM'
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

#echo 'Installing MongoDB'


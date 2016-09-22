#!/bin/sh

echo 'Adding necessary repositories'
#sudo apt-add-repository ppa:fish-shell/release-2

echo 'Updating and installing packages'
sudo apt-get update
sudo apt-get install gcc gfortran g++ curl fish \
	#xorg-dev libreadline-dev \
	wget -y

# Docker

# Vagrant

# Programming languages

# Both pythons with PyPi and Virtualenv

echo 'Installing RVM with Rails'
gpg --keyserver hkp://keys.gnupg.net \
	--recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --rails

echo 'Installing NVM'
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

#echo 'Installing MongoDB'

echo 'Installing oh-my-fish'
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

#Install R - easier to just do it with apt-get if avaliable
# NOT WORKING
#echo 'Installing R'
#$RVERSION = 3.2.5
#wget https://cran.r-project.org/src/base/R-3/R-3.2.4.tar.gz
#tar -zxvf R-$RVERSION.tar.gz
#cd /tmp/R-$RVERSION/
#./configure --with-x=no
#make
#cd -

echo 'Installing Docker'
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker <username> && sudo service docker start
#newgrp docker

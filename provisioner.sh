#!/bin/bash

set -e

# Shell helpers
echo 'Installing oh-my-fish'
#curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
source "./scripts/install-omf.sh"

# Docker
#TODO: better way?
echo 'Installing Docker'
#wget -qO- https://get.docker.com/ | sh
#sudo usermod -aG docker <username> && sudo service docker start
#newgrp docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

# Vagrant

# Programming languages

# Both pythons with PyPi and Virtualenv

echo 'Installing NVM'
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

#TODO: optional?
echo 'Installing RVM with Rails'
gpg --keyserver hkp://keys.gnupg.net \
	--recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --rails

echo 'Installing SDKMAN'
curl -s "https://get.sdkman.io" | bash

#echo "Installing R package and dependencies"
#cd tmp
#git clone https://github.com/jalvesaq/colorout.git
#R CMD INSTALL colorout
#TODO: install devtools?
#R CMD INSTALL devtools

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

#echo 'Installing MongoDB'

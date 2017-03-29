#!/bin/sh -eu
# Script to install common nodejs global modules

set -eu

echo "Checking if NPM is installed"
npm -v
if [[ $? -ne 0 ]]; then
	exit 0;
fi

# Taken from https://github.com/flesler/dotfiles/blob/master/npm/global.sh
MODULES='jshint htmlhint nodemon public-ip ip-location-cli jscs'
# To remember for later
MANUAL='node-inspector node-pv'

for module in $MODULES; do
	echo "Installing $module..."
	npm install --global ${module}@latest
done

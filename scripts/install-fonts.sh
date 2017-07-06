#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: OSX version?

set -e
sudo -v

echo "Installing Droid Sans Mono for Powerline font"

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo \
	"Droid Sans Mono for Powerline Nerd Font Complete.otf" \
	https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
cd -

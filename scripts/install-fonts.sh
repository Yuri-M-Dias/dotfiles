#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: OSX version?

set -e
sudo -v

echo "Installing Droid Sans Mono for Powerline font with Nerd Icons"
FONTS_FOLDER="~/.local/share/fonts"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	mkdir -p ~/.local/share/fonts
	FONTS_FOLDER="~/.local/share/fonts"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	FONTS_FOLDER="~/Library/Fonts"
else
	echo "Couldn't identify the OS! Not doing anything!"
	exit 1;
fi

cd "$FONTS_FOLDER"

curl -fLo \
	"Droid Sans Mono for Powerline Nerd Font Complete.otf" \
	https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
cd -

#!/bin/bash

set -e
sudo -v

echo "Installing Droid Sans Mono for Powerline font with Nerd Icons"
export FONTS_FOLDER="~/.local/share/fonts"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	mkdir -p ~/.local/share/fonts
elif [[ "$OSTYPE" == "darwin"* ]]; then
	FONTS_FOLDER="~/Library/Fonts"
else
	echo "Couldn't identify the OS! Not doing anything!"
	exit 1;
fi

cd $FONTS_FOLDER/

curl -fLo \
	"Droid Sans Mono for Powerline Nerd Font Complete.otf" \
	 https://github.com/ryanoasis/nerd-fonts/raw/1.1.0/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
cd -

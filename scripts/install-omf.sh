#!/bin/bash

set -e

curl -L https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install_omf
fish install_omf --path=~/.local/share/omf --config=~/dotfiles/omf

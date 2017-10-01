#!/bin/bash

set -e

curl -L https://get.oh-my.fish > install_omf
fish install_omf --path=~/.local/share/omf --config=~/.dotfles/omf

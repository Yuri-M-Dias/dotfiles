#!/bin/bash

set -e

TMUX_SPLIT_GITHUB_FIX="https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/R/tmux_split.vim"
FIX_LOCATION="$HOME/.config/nvim/opt"

echo "Installing to $FIX_LOCATION"
mkdir -p $FIX_LOCATION
cd $FIX_LOCATION

wget --continue -nc -v $TMUX_SPLIT_GITHUB_FIX

cd -


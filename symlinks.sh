#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: this file is a clusterfuck. Use functions, for Stallman's sake!

set -e
sudo -v

DOTPATH=$(pwd)

# May not be necessary anymore
echo 'Creating vim folders'
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup/
mkdir -p ~/.vim/swap/
mkdir -p ~/.vim/undo/

echo 'Creating links to config files'
#ln -sfn $DOTPATH/zshenv ~/.zshenv
ln -sfn "$DOTPATH/vimrc" ~/.vimrc
ln -sfn "$DOTPATH/tmux.conf" ~/.tmux.conf
ln -sfn "$DOTPATH/gitconfig" ~/.gitconfig
ln -sfn "$DOTPATH/bash_aliases" ~/.bash_aliases
ln -sfn "$DOTPATH/ideavimrc" ~/.ideavimrc

#Fish configuration
echo 'Creating fish folders'
mkdir -p ~/.config/fish/
#mkdir -p ~/.config/fish/functions/
ln -s "$DOTPATH/fish-config/functions/" ~/.config/fish/functions
ln -sfn "$DOTPATH/fish-config/aliases.fish" ~/.config/fish/aliases.fish
# TODO: OMF config, themes and plugins?
# Backup the current one
#mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bkp
ln -sfn "$DOTPATH/fish-config/config.fish" ~/.config/fish/config.fish
ln -sfn "$DOTPATH/omf/" ~/.config/omf

echo 'Linking R profile'
ln -sfn "$DOTPATH/Rprofile" ~/.Rprofile

# Symlinks nvim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s "$DOTPATH/vimrc" ~/.config/nvim/init.vim

echo 'Installing vim plugins'
nvim +PlugInstall


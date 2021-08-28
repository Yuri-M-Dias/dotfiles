#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: this file is a clusterfuck. Use functions, for Stallman's sake!

set -e
sudo -v

echo "Executing symlinks"
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# May not be necessary anymore
echo 'Creating vim folders'
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup/
mkdir -p ~/.vim/swap/
mkdir -p ~/.vim/undo/

echo 'Creating links to config files'
#ln -sfn $DOTFILES/zshenv ~/.zshenv
ln -sfn "$DOTFILES/vimrc" ~/.vimrc
ln -sfn "$DOTFILES/tmux.conf" ~/.tmux.conf
ln -sfn "$DOTFILES/gitconfig" ~/.gitconfig
ln -sfn "$DOTFILES/bash_aliases" ~/.bash_aliases
ln -sfn "$DOTFILES/ideavimrc" ~/.ideavimrc

# Commit messages pattern
ln -sfn "$DOTFILES/gitmessage" ~/.gitmessage

#Fish configuration
echo 'Creating fish folders'
mkdir -p ~/.config/fish/
#mkdir -p ~/.config/fish/functions/
ln -sfn "$DOTFILES/fish-config/functions" ~/.config/fish/functions
ln -sfn "$DOTFILES/fish-config/aliases.fish" ~/.config/fish/aliases.fish
# TODO: OMF config, themes and plugins?
# Backup the current one
#mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bkp
ln -sfn "$DOTFILES/fish-config/config.fish" ~/.config/fish/config.fish
ln -sfn "$DOTFILES/omf" ~/.config/omf

echo 'Linking R profile'
ln -sfn "$DOTFILES/Rprofile" ~/.Rprofile

echo "Adding MPV.conf"
mkdir -p ~/.config/mpv/
ln -sfn "$DOTFILES/mpv.conf" ~/.config/mpv/mpv.conf
ln -sfn "$DOTFILES/input.conf" ~/.config/mpv/input.conf

# Symlinks nvim
echo "Symlinking Neovim"
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s "$DOTFILES/vimrc" ~/.config/nvim/init.vim

echo "Cloning my vimwiki"
git clone https://github.com/Yuri-M-Dias/wiki ~/vimwiki --progress

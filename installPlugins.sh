#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: this file is a clusterfuck. Use functions, for Stallman's sake!

set -e
sudo -v

echo 'Adding necessary repositories'
sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

echo 'Installing dependencies'
sudo apt-get update -y
#TODO: separate the libs/tools/programming languages here
sudo apt-get install \
	python2.7-dev python3.5-dev zsh silversearcher-ag \
	libevent-dev markdown vim vim-nox \
	gcc gfortran g++ curl fish wget \
	autotools-dev automake ncurses-dev \
	clang-3.5 cmake clang-format-3.5 exuberant-ctags \
	python-setuptools python3-setuptools neovim \
	-y --verbose-versions

echo 'Update tmux, compiling from source'
git clone https://github.com/tmux/tmux/
cd tmux
sh autogen.sh
./configure && make
[ -f ./tmux ] && sudo mv ./tmux /usr/bin/
cd -

echo 'Install tmux plugin manager'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Installing fonts'
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd -

#TODO: finish using a single font
#curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

# May not be necessary anymore
echo 'Creating vim folders'
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup/
mkdir -p ~/.vim/swap/
mkdir -p ~/.vim/undo/

echo 'Creating links to config files'
#ln -sfn `pwd`/zshenv ~/.zshenv
ln -sfn `pwd`/vimrc ~/.vimrc
ln -sfn `pwd`/tmux.conf ~/.tmux.conf
ln -sfn `pwd`/gitconfig ~/.gitconfig
ln -sfn `pwd`/bash_aliases ~/.bash_aliases
ln -sfn `pwd`/ideavimrc ~/.ideavimrc

#Fish configuration
echo 'Creating fish folders'
mkdir -p ~/.config/fish/
#mkdir -p ~/.config/fish/functions/
ln -s `pwd`/fish-config/functions/ ~/.config/fish/functions
ln -sfn `pwd`/fish-config/aliases.fish ~/.config/fish/aliases.fish
# TODO: OMF config, themes and plugins?
# Backup the current one
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bkp
ln -sfn `pwd`/fish-config/config.fish ~/.config/fish/config.fish
ln -sfn `pwd`/omf/ ~/.config/omf

echo 'Linking R profile'
ln -sfn `pwd`/Rprofile ~/.Rprofile

echo 'Installing vim plugins'
nvim +PlugInstall

# Symlinks nvim
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s `pwd`/vimrc ~/.config/nvim/init.vim

echo 'Cleaning up...'
rm -Rf fonts/
rm -Rf tmux/

#!/bin/sh
# Updated to work with Ubuntu 16.04 and kernel 4.4.x
#TODO: this file is a clusterfuck. Use functions, for Stallman's sake!

set -e
sudo -v

export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Executing on $DOTFILES"

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
	uncrustify \
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

source "$DOTFILES/scripts/install-fonts.sh"

source "$DOTFILES/symlinks.sh"

echo 'Cleaning up...'
rm -Rf fonts/
rm -Rf tmux/

#!/bin/sh

echo 'Installing dependencies'
sudo apt-get update
sudo apt-get install cmake python2.7-dev python3.4-dev zsh silversearcher-ag \
                     exuberant-ctags libevent-dev markdown vim vim-nox \
                     autotools-dev automake ncurses-dev clang-3.5 \
                     clang-format-3.5 -y

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

echo 'Creating vim folders'
mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/backup/
mkdir -p ~/.vim/swap/
mkdir -p ~/.vim/undo/

echo 'Installing vundle'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'Creating links to config files'
#ln -sfn `pwd`/zshenv ~/.zshenv
#TODO: fishrc? OMF?
ln -sfn `pwd`/vimrc ~/.vimrc
ln -sfn `pwd`/tmux.conf ~/.tmux.conf
ln -sfn `pwd`/gitconfig ~/.gitconfig

#Fish configuration
ln -sfn `pwd`/fish-config/functions/aliases.fish ~/.config/fish/aliases.fish
#Backup the current one
mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bkp
ln -sfn `pwd`/fish-config/config.fish ~/.config/fish/config.fish

#Installs Vim-gitgutter, because not on Vundle
echo 'Installing Vim-gitgutter'
cd /tmp && git clone git://github.com/airblade/vim-gitgutter.git
cp -r vim-gitgutter/* ~/.vim
cd -

echo 'Installing vim plugins'
vim +PluginInstall +qall


#!/bin/bash
#set -e
#TODO: NOT WORKING RIGHT NOW
sudo -v

#curl https://pyenv.run | bash

PY2="2.7.16"
PY3="3.7.3"

pyenv install $PY2
pyenv install $PY3

pyenv virtualenv $PY2 neovim2
pyenv virtualenv $PY3 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python  # Note the path
NEOVIM2=$(pyenv which python)  # Note the path

pyenv activate neovim3
pip install neovim
NEOVIM3=$(pyenv which python)  # Note the path

# The following is optional, and the neovim3 env is still active
# This allows flake8 to be available to linter plugins regardless
# of what env is currently active.  Repeat this pattern for other
# packages that provide cli programs that are used in Neovim.
pip install flake8
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH

echo "Py2: $NEOVIM2"
echo "Py3: $NEOVIM3"

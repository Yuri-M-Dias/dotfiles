# Path to Oh My Fish install.
#set -q XDG_DATA_HOME
#and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/yuri/.config/omf"

# Load oh-my-fish configuration.
#source $OMF_PATH/init.fish
source ~/.config/fish/aliases.fish

eval (python -m virtualfish)

#set -x PATH "/home/yuri/.pyenv/bin $PATH"
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# sdkman
#test -s "$HOME/.sdkman/bin/sdkman-init.sh"; and sdk help > /dev/null ^ /dev/null
#
# Bobthefish configs
#set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes


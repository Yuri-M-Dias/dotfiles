################################
###  Bash-like aliases for fish.
################################
alias ..="cd .."
alias ...="cd ../.."
alias -="cd -"

alias la="ls -Gla"
# List only directories
alias lsd='ls -l | grep "^d"'
alias ll='ls -ahlF'
alias l='ls -CF'

alias getmyip='dig +short myip.opendns.com @resolver(shuf -i 1-4 -n 1).opendns.com'

# Force tmux to use 256 colors
alias tmux='tmux -2'

################################
###  File ShortCut
################################
alias g="git"

################################
###  Program ShortCut
################################

# git related shortcuts
alias undopush="git push -f origin HEAD^:master"
alias undocommit="git reset HEAD~"
alias addtocommit="git commit --amend -C HEAD"
#Diff
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
# Commit
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gcv="git commit -v"

# Git status
alias gst="git status -sb --ignore-submodules"
alias gss="git status"
alias gsst="git status"
alias gl="git log"
alias gls="git log --stat"
alias glsa="git log --stat --all"
#Merge
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
# Pushes only the current branch
alias gpuoh="git push origin HEAD"
alias grs="git reset --soft"
alias grh="git reset --hard"
#Branch
alias gb="git branch"
alias gbd="git branch -D"
alias gba="git branch -a"
#Checkout
alias gchob="git checkout -b"
alias gcho="git checkout"
alias gchpk="git cherry-pick"
alias gplom="git pull origin master"

alias gfo="git fetch origin"

alias ..="cd .."
alias ...="cd ../.."
alias -="cd -"

alias la="ls -Gla"

# List only directories
alias lsd='ls -l | grep "^d"'

alias ll='ls -ahlF'
alias l='ls -CF'

################################
###  File ShortCut
################################
alias g="git"

################################
###  Program ShortCut
################################

# git related shortcuts
alias undopush="git push -f origin HEAD^:master"
alias addtocommit="git commit --amend -C HEAD"
#Diff
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
# Commit
alias gca="git commit -a -m"
alias gcm="git commit -m"
# Git status
alias gst="git status -sb --ignore-submodules"
alias gss="git status"
alias gl="git log"
alias gls="git log --stat"
#Merge
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grs="git reset --soft"
alias grh="git reset --hard"
#Branch
alias gb="git branch"
alias gbd="git branch -D"
alias gba="git branch -a"
#Checkout
alias gcob="git checkout -b"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gpom="git pull origin master"

alias gfo="git fetch origin"

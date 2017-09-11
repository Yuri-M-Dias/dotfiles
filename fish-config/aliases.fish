################################
###  Bash-like aliases for fish.
################################
alias ..="cd .."
alias ...="cd ../.."
# https://github.com/fish-shell/fish-shell/issues/3810
#alias -="cd -"
abbr -a -- - 'cd -'

#alias la="ls -Glah"

function la -d "Show everything using exa"
    if command --search exa >/dev/null
        command exa -al --git $argv
    else
        ls -Glah $argv
    end
end

# List only directories
alias lsd='ls -la | grep "^d"'
alias ll='ls -ahlF'
alias l='ls -CF'

alias apt="sudo apt"
alias aptU="apt update"
alias aptI="apt install"
alias aptRm="apt remove"
alias aptUpg="apt upgrade"
alias aptLs="apt list"
alias aptLsUp="aptLs --upgradable"

alias getmyip='dig +short myip.opendns.com @resolver(shuf -i 1-4 -n 1).opendns.com'
alias scanOpenPorts="nmap -sT -p-"

# Force tmux to use 256 colors
#alias tmux='tmux -2'

# Easier clipboard on unix
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# Merge fish history
alias histmerge='history --merge'
# Reloads fish config
alias reloadConfig='source ~/.config/fish/config.fish'

# Check current directoy and subdirectories sizes
alias checkPWDSize='du -ah . | grep -v "/\$" | sort -rh'

# Execute a bash alias
alias executeBash='bash -l -i -c'

# Easier downloading stuff on the internet
alias wgetNM='wget -mN'

alias dropLinuxCache='su - root --command " sync; echo 1 > /proc/sys/vm/drop_caches"'

alias isTheInternetOnFire='dig +short -t txt istheinternetonfire.com'

################################
###  Ubuntu-related shortcuts
################################
# Resets the network manager, sometimes makes the connection works
alias resetNetwork="sudo service network-manager restart"

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
alias gaa="git add . -A"
# Commit
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gcv="git commit -v"
# Stash
alias gtash="git stash"
alias gtasha="git stash apply"
alias gtashl="git stash list"

# Git status
alias gst="git status -sb --ignore-submodules"
alias gss="git status"
alias gsst="git status --short"
# Git logs
alias gl="git log"
alias gls="git log --stat"
alias glsa="git log --stat --all"
alias glp="git log -p"
# See gitconfig
alias glpt="git prettytree"
alias glg="git lg"
alias glagp="git lagp"
# Merge
alias gmnff="git merge --no-ff"
alias gptg="git push --tags"
alias gp="git push --verbose"
# Pushes only the current branch
alias gpuoh="git push origin HEAD"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias grHEAD="git reset HEAD"
# Branch
alias gb="git branch"
alias gbd="git branch -d"
alias gba="git branch -a"
# Deletes local branches that have been already merged into master
alias gbcleanLocal="git branch --merged master | grep -v 'master\$' | xargs git branch -d"
# Checkout
alias gchob="git checkout -b"
alias gcho="git checkout"
alias gchpk="git cherry-pick"
# From Remote
alias gplom="git pull origin master"
alias gplr="git pull --rebase -v"
alias gfo="git fetch origin -v"
alias gfop="git fetch origin --prune -v"
alias gclo="git clone"

# Since git doesn't seem to provide a profiling alternative...
alias addGitUserMain="git config user.name 'Yuri-M-Dias'; and git config user.email 'yurimathe.yp@gmail.com'"

#####
# Grails and Groovy shortcuts: @gra
#####
alias @gracl="grails clean"
alias @gracmp="grails compile"
alias @grarecmp="@gracl; and @gracmp"
alias @grarapp="grails run-app"
alias @graip="grails install-plugin"
alias @grawrap="grails wrapper"
# Creation
alias @gracapp="grails create-app"
alias @gracdc="grails create-domain-class"
alias @gracc="grails create-controller"
alias @gracsc="grails create-scaffold-controller"
alias @gracse="grails create-service"
alias @gracfs="grails create-filters"
alias @gracit="grails create-integration-test"
alias @gractl="grails create-tag-lib"
alias @gracft="grails create-functional-test"
# Tests
alias @gratsa="grails test-app"
alias @gratsai="grails test-app -integration"
alias @gratsau="grails test-app -unit"
alias @gratsaf="grails test-app -functional"
# Plugin only? Really necessary anymore?
alias @grafts="grails functional-tests"

#####
# Docker-related: @do
#####
alias @do="docker"
alias @dov="@do version"
alias @doi="@do info"
alias @doifip="@do inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias @dopsa="@do ps -a"
alias @dolgf="@do log -f"
alias @doimgs="@do images"
alias @dopll="@do pull"

################################
###  My common files shortcuts
################################
#TODO: make these into some sort of ambient variable
alias @dev="cd ~/Dev"
alias @dot="cd ~/dotfiles"

# I use these so much
alias @tsys="tail /var/log/syslog"
alias @tfsys="tailf /var/log/syslog"

# Easier to just remember how it works
alias @nvimPlugInstall="nvim +PlugInstall +PlugClean +q"

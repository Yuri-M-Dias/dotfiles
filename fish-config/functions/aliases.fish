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

# Merge fish history
alias histmerge='history --merge'
alias reloadConfig='source ~/.config/fish/config.fish'

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

# Git status
alias gst="git status -sb --ignore-submodules"
alias gss="git status"
alias gsst="git status --short"
alias gl="git log"
alias gls="git log --stat"
alias glsa="git log --stat --all"
alias glp="git log -p"
#Merge
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
# Pushes only the current branch
alias gpuoh="git push origin HEAD"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gruns="git reset HEAD"
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

# Since git doesn't seem to provide a profiling alternative...
alias addGitUserMain="git config user.name 'Yuri-M-Dias'; and git config user.email 'yurimathe.yp@gmail.com'"
#alias gitUserZG="git fetch origin"

# Since git doesn't seem to provide a profiling alternative...
alias addGitUserMain="git config user.name 'Yuri-M-Dias'; and git config user.email 'yurimathe.yp@gmail.com'"
#alias gitUserZG="git fetch origin"



#####
# Grails and Groovy shortcuts
#####
alias @gracl="grails clean"
alias @gracmp="grails compile"
alias @grarecmp="@gracl; and @gracmp"
alias @grarapp="grails run-app"
alias @graip="grails install-plugin"
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


# Aliases in this file are bash and zsh compatible

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# Dotfiles management
alias caju="git --git-dir=$HOME/.jurubeba_lion_of_the_north --work-tree=$HOME/"

# SSH
alias ssh="TERM=xterm ssh"

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias cl='clear'
alias ka9='killall -9'
alias k9='kill -9'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Zippin - Use lrzip or lrztar, seriously...
alias gz='tar -zcvf'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $XDG_CONFIG_HOME/zsh/scripts/aliases.zsh
}

alias reloadzsh='source $HOME/.zshenv && source ${ZDOTDIR:-$HOME}/.zshrc'
alias ae='vim $XDG_CONFIG_HOME/zsh/scripts/aliases.zsh' #alias edit
alias ar='source $XDG_CONFIG_HOME/zsh/scripts/aliases.zsh'  #alias reload
alias aes='vim $HOME/.secrets' #secrets edit
alias ars='source $HOME/.secrets' #secrets reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# mimic vim functions
alias :q='exit'

## Git Aliases ##
# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
# Git tools
alias hpr='hub pull-request'
alias grb='git recent-branches'
# Try to remove last stash or user version
gstu() {
  local version=${1:-0}
  git stash show -p stash@{$version} | git apply --reverse
}

# Ruby/Rails
alias c='rails c' # Rails 3+
alias co='script/console' # Rails 2
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'
# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'
# rake db
alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'
# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'
alias buses='brew uses --installed'
alias bdeps='brew deps --installed --tree'

# Node
alias ng='npm -g'
alias npmOutdated='ng outdated --parseable=true | cut -d : -f 4 | xargs -n 1 ng install'
alias ng0='ng ls --depth 0'
alias n0='npm ls --depth 0'
# + SvelteKit
alias svkrun='pnpm dev --open'


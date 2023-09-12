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
# Open zimfw git aliases
alias vimgit='vim ~/.config/zsh/.zim/modules/git/init.zsh'
# Try to remove last stash or user version
Gstu() {
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


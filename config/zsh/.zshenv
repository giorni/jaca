# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
# setting defaults to use with non compliant tools
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache
# export XDG_RUNTIME_DIR=

# fasd
export _FASD_DATA=$XDG_DATA_HOME/fasd/data

# less
export LESSHISTFILE=$XDG_DATA_HOME/less/history

# mysql
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql/history

# node
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node/repl_history

# node-gyp
export npm_config_devdir=$XDG_CACHE_HOME/node-gyp

# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# openssl
export RANDFILE=$XDG_CACHE_HOME/.rnd

# pry
export PRYRC=$XDG_CONFIG_HOME/pry/pryrc

# readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# rubygems - chruby
# export GEM_HOME=$XDG_DATA_HOME/gem
# export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem 

# rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# terminfo
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$TERMINFO:/usr/share/terminfo

# vim - this overwrite nvim too
# export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

source $ZDOTDIR/.zprezto/runcoms/zshenv

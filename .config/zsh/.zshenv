# TODO - MOVE IT1
# Probably everything but the sourcing

# xdg
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
# setting defaults to use with non compliant tools
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache
# export XDG_RUNTIME_DIR=

# fasd
export _FASD_DATA=$XDG_DATA_HOME/fasd/data

# less
export LESSHISTFILE=$XDG_DATA_HOME/less/history

# mysql
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql/history

# readline
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc

# terminfo
export TERMINFO=$XDG_DATA_HOME/terminfo
export TERMINFO_DIRS=$TERMINFO:/usr/share/terminfo

# vim - this overwrite nvim too
# export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

source $ZDOTDIR/.zprezto/runcoms/zshenv

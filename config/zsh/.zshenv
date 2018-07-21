# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# setting defaults to use with non compliant tools
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache
# export XDG_RUNTIME_DIR=

# use zsh with XDG
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

source $ZDOTDIR/.zprezto/runcoms/zshenv

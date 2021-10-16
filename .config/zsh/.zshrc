# This may be overwritten by /etc/zshrc, which runs after zshenvs
export HISTFILE=$XDG_CACHE_HOME/prezto/.zsh_history
source $ZDOTDIR/.zprezto/runcoms/zshrc
for config_file ($ZDOTDIR/scripts/*.zsh) source $config_file


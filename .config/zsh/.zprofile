eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZDOTDIR/.zprezto/runcoms/zprofile


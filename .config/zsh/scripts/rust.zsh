export RUSTUP_HOME=$XDG_DATA_HOME/rustup

# pathAppend $HOME/.cargo/bin

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi


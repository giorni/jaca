# TODO: REMOVE THIS LATER
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node/repl_history

# node-gyp
export npm_config_devdir=$XDG_CACHE_HOME/node-gyp

pathAppend $XDG_DATA_HOME/npm/bin

# pnpm setup
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# TODO: Probably remove this, does not make sense anymore
export RANDFILE=$XDG_CACHE_HOME/.rnd

# Fix conflict between system and Homebrew
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_FALLBACK_LIBRARY_PATH


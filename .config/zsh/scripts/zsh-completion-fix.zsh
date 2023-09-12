# https://github.com/zimfw/completion/issues/10
# same with cohesive-wg and cohesive-vpn
zstyle ':completion:*' matcher-list \
  'm:{[:lower:]-}={[:upper:]_} r:|[.]=**' \
  '+l:|=*'


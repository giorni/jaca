eval "$(atuin init zsh)"

# Fix atuin keybindings because zimfw 'input' module overrides them
_atuin_deferred_init_precmd() {
	local key
	for key ('^[[A' ${key_info[Up]}) bindkey -M viins ${key} atuin-search-viins
	precmd_functions=(${precmd_functions:#_atuin_deferred_init_precmd})
	unfunction _atuin_deferred_init_precmd
}
autoload -Uz add-zsh-hook && add-zsh-hook precmd _atuin_deferred_init_precmd

# bindkey -M viins '^r' atuin-search-viins
# bindkey -M viins '^[OA' atuin-up-search-viins
# bindkey -M viins '^[[A' atuin-up-search-viins
# bindkey -M vicmd '/' atuin-search
# bindkey -M vicmd '^[[A' atuin-up-search-vicmd
# bindkey -M vicmd '^[OA' atuin-up-search-vicmd
# bindkey -M vicmd 'k' atuin-up-search-vicmd

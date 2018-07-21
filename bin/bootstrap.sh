# neovim
# python 3
# fzy fuzzy search
# rg ripgrep
# ruby-install ruby manager
# chruby ruby manager
brew install neovim python fzy rg ruby-install chruby

# neovim plugins dependency
pip3 install neovim

# support for italics with macos and tmux
# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
# basically, if needed, override xterm-256color with italics (can use same name)
# create tmux-256color and use it
# NO vim configuration or tmux terminal override option for italic needed (still uses Tc override)
# more here: https://github.com/neovim/neovim/issues/3461

# link files to home:
#                   config => ~/.config
#                    local => ~/.local         # may change
#                      bin => ~/.bin
#    ~/.config/zsh/.zshenv => ~/.zshenv
# ~/.config/tmux/tmux.conf => ~/.tmux.conf


" general
set nocompatible
set clipboard=unnamedplus " integrate with os clipboard
set mouse=a
let mapleader="," " o u diferentão

" Fast alias to clear /{search} hilightning with //
nnoremap <silent> // :let @/ = ""<cr>

" Search VIM manual help_tags
" /|.\{-}| " REF

" Defaults to VIM
" https://github.com/neovim/neovim/blob/master/runtime/doc/vim_diff.txt
" https://github.com/neovim/neovim/issues/16100
" Use it for debugging, if needed
" set shortmess-=F " Enable echoing from autocmd (need to read the docs better though)

if has('nvim')
  " Load Packer
  lua require('jaca')
end

" Supported colors
if (has("termguicolors"))
  set termguicolors
endif

" general 2
let g:is_bash=1                 " default shell syntax
set undofile
set hidden                      " http://items.sjbach.com/319/configuring-vim-right
set number                      "Line numbers are good
set relativenumber
set scrolloff=8
set backspace=indent,eol,start  "Allow backspace in insert mode
set showcmd                     "Show incomplete cmds down the bottom
set noshowmode                  " Do not show mode at command line since it is already at status line
" set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim
set nowrap                      "Don't wrap lines
" set wrap                        "Wrap lines
set linebreak                   "Wrap lines at convenient points
" set visualbell                  "No sounds
set list
set cursorline                  "Highlight cursor focused line
filetype on
filetype plugin on
filetype indent on
" indent
set autoindent
set smartindent
set smarttab
set shiftwidth=2  "indentation size
set softtabstop=2 "tab key actual inserted spaces
set tabstop=2     "normal tab char spaces size
set expandtab     "expand tab to spaces on insert
" search
set incsearch
set hlsearch
set ignorecase
set smartcase
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~ 
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=node_modules/**
set wildignore+=bower_components/**
set wildignore+=src-electron/**
" turn off swap files, maybe?
" set noswapfile
" set nobackup
" set nowb


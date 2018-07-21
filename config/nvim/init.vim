" general
set nocompatible
set clipboard=unnamedplus " integrate with os clipboard
set mouse=a
let mapleader=","

" install plugins
call plug#begin('~/.local/share/nvim/site/plug')
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'bfredl/nvim-miniyank'
Plug 'cloudhead/neovim-fuzzy'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux'
Plug 'fenetikm/falcon'
" terryma/vim-multiple-cursors
call plug#end()

" netrw
let g:netrw_home=stdpath('data')."/netrw"

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif

colorscheme falcon
let g:falcon_airline = 1
let g:airline_theme = 'falcon'

" deoplete
let g:deoplete#enable_at_startup = 1

" miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

" fuzzy
nnoremap <leader>b :FuzzyOpen<CR>
nnoremap <leader>s :FuzzyGrep<CR>

" general
set undofile
set hidden                      " http://items.sjbach.com/319/configuring-vim-right
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim
" set visualbell                  "No sounds
set list
syntax on
filetype on
filetype plugin on
filetype indent on

" ident
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" turn off swap files, maybe?
" set noswapfile
" set nobackup
" set nowb

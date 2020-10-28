" general
set nocompatible
set clipboard=unnamedplus " integrate with os clipboard
set mouse=a
let mapleader=","
nnoremap <silent> // :let @/ = ""<cr>

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
Plug 'sheerun/vim-polyglot'
"Plug 'fenetikm/falcon'
Plug 'ayu-theme/ayu-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'rust-lang/rust.vim'
Plug 'eliba2/vim-node-inspect'
" terryma/vim-multiple-cursors
call plug#end()

" netrw
let g:netrw_home=stdpath('data')."/netrw"
" avoid netrw reload, I don't use it
" it conflicts with vim and tmux navigation
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nnoremap <buffer> <c-l> :TmuxNavigateRight<cr>
endfunction

" syntax on
" colorscheme
if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
silent! colorscheme ayu
hi! Normal guibg=Black

" LeaderF color customization
let g:Lf_PopupPalette = {
      \  'dark': {
      \      'Lf_hl_rgFileName': {
      \                'gui': 'NONE',
      \                'font': 'NONE',
      \                'guifg': 'LightBlue',
      \                'guibg': 'NONE',
      \                'cterm': 'NONE',
      \                'ctermfg': 'NONE',
      \                'ctermbg': 'NONE'
      \              },
      \      'Lf_hl_bufDirname': {
      \                'gui': 'NONE',
      \                'font': 'NONE',
      \                'guifg': 'LightBlue',
      \                'guibg': 'NONE',
      \                'cterm': 'NONE',
      \                'ctermfg': 'NONE',
      \                'ctermbg': 'NONE'
      \              }
      \  }
      \}

" legacy theme color customization
" let g:falcon_background = 0
" let g:falcon_inactive = 1
" silent! colorscheme falcon
" let g:falcon_airline = 1
" let g:airline_theme = 'falcon'

" deoplete
let g:deoplete#enable_at_startup = 1

" default shell syntax
let g:is_bash = 1

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

" turn off swap files, maybe?
" set noswapfile
" set nobackup
" set nowb

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
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

" leaderf
let g:Lf_ShowDevIcons = 0
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "", 'right': "" }
let g:Lf_PreviewResult = { 'Function': 0, 'BufTag': 0 }
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fg :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>

" node-inspector
nnoremap <silent><F4> :NodeInspectStart<cr>
nnoremap <silent><F5> :NodeInspectRun<cr>
nnoremap <silent><F6> :NodeInspectConnect("127.0.0.1:9229")<cr>
nnoremap <silent><F7> :NodeInspectStepInto<cr>
nnoremap <silent><F8> :NodeInspectStepOver<cr>
nnoremap <silent><F9> :NodeInspectToggleBreakpoint<cr>
nnoremap <silent><F10> :NodeInspectStop<cr>


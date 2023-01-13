" basic configuration for platforms not supporting nvim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ============= Set XDG defaults ====================
" From https://gist.github.com/dkasak/6ae1c6bf0d771155f23b
if empty("$XDG_CACHE_HOME")
  let $XDG_CACHE_HOME=$HOME."/.cache"
endif

if empty("$XDG_CONFIG_HOME")
  let $XDG_CONFIG_HOME=$HOME."/.config"
endif

if empty("$XDG_DATA_HOME")
  let $XDG_DATA_HOME=$HOME."/.local/share"
endif

let $VIMCONFIG = $XDG_CONFIG_HOME."/vim"
let $VIMCACHE = $XDG_CACHE_HOME."/vim"
let $VIMDATA = $XDG_DATA_HOME."/vim"
set viminfo+=n$VIMCACHE/viminfo

" This is disabled, but if manually set, lets not trash our home
let directory=$XDG_CACHE_HOME."/vim/swap,~/,/tmp"
let backupdir=$XDG_CACHE_HOME."/vim/backup,~/,/tmp"

" ============== Set new Path =======================
" This is the most important thing ever!
" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" ALTERNATIVE what is the name of the directory containing this file?
" let s:portable = expand('<sfile>:p:h')
" May be used with $VIMINIT being sourced
let s:portable = $VIMCONFIG

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" ============= install plugins =====================
if empty(glob($VIMCONFIG. '/autoload/plug.vim'))
  silent execute '!curl -fLo '.$VIMCONFIG.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($VIMDATA.'/site/plug')
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
let &undodir = $VIMCACHE."/undo"
if has('persistent_undo') && isdirectory($VIMCACHE)
  call mkdir(&undodir, 'p')
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" set nowrap       "Don't wrap lines
set wrap         "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
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

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

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
set shortmess-=F " Enable echoing from autocmd (need to read the docs better though)

" install plugins
call plug#begin(stdpath('data').'/site/plug')
Plug 'christoomey/vim-tmux-navigator'
Plug 'bfredl/nvim-miniyank'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'

" Try
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

" Load Packer
lua require('plugins')
lua require('config')
lua require('lsp_config')

" general 2
let g:is_bash = 1               " default shell syntax
set undofile
set hidden                      " http://items.sjbach.com/319/configuring-vim-right
set number                      "Line numbers are good
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

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif
" colorscheme aquarium
colorscheme spaceduck

" miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <Leader>c <Plug>(miniyank-tochar)
map <Leader>l <Plug>(miniyank-toline)
map <Leader>b <Plug>(miniyank-toblock)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope keymaps<cr>
nnoremap <leader>fc <cmd>Telescope lsp_code_actions<cr>

" See  what EditorConfig is thinking about my file
let g:EditorConfig_filetype = 1
let g:EditorConfig_verbose = 0              " REF
let g:editorconfig_core_vimscript_debug = 0 " REF

" vsnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.ruby = ['rails']


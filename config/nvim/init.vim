" general
set nocompatible
set clipboard=unnamedplus " integrate with os clipboard
set mouse=a
let mapleader=","

" Fast alias to clear /{search} hilightning with //
nnoremap <silent> // :let @/ = ""<cr>

" install plugins
call plug#begin('~/.local/share/nvim/site/plug')
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

" Completion, replacing.
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neco-syntax'
"
" Replaced by telescope.nvim
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'cloudhead/neovim-fuzzy'
"
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
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

" " deoplete
" let g:deoplete#enable_at_startup = 1

" " fuzzy
" nnoremap <leader>b :FuzzyOpen<CR>
" nnoremap <leader>s :FuzzyGrep<CR>

" " LeaderF customization
" " color
" let g:Lf_PopupPalette = {
"                   \  'dark': {
"                   \    'Lf_hl_rgFileName': {
"                   \      'gui': 'NONE',
"                   \      'font': 'NONE',
"                   \      'guifg': 'LightBlue',
"                   \      'guibg': 'NONE',
"                   \      'cterm': 'NONE',
"                   \      'ctermfg': 'NONE',
"                   \      'ctermbg': 'NONE'
"                   \      },
"                   \    'Lf_hl_bufDirname': {
"                   \      'gui': 'NONE',
"                   \      'font': 'NONE',
"                   \      'guifg': 'LightBlue',
"                   \      'guibg': 'NONE',
"                   \      'cterm': 'NONE',
"                   \      'ctermfg': 'NONE',
"                   \      'ctermbg': 'NONE'
"                   \    }
"                   \  }
"                   \}
" " rg
" let g:Lf_RgConfig = [
"                   \ "--max-columns=300",
"                   \ "--glob=!node_modules/*",
"                   \ "--glob=!dist/*",
"                   \]
" " options
" let g:Lf_ShowDevIcons = 0
" let g:Lf_UseCache = 0
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" " popup mode
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_StlSeparator = { 'left': "", 'right': "" }
" let g:Lf_PreviewResult = { 'Function': 0, 'BufTag': 0 }
" let g:Lf_ShortcutF = "<leader>ff"
" " mapping
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <leader>fg :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>


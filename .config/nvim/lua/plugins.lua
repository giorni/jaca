local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PackerBootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Package manager
  use { 'wbthomason/packer.nvim' }

  -- TODO review (all)
  use { 'christoomey/vim-tmux-navigator' }
  use { 'bfredl/nvim-miniyank' }
  use { 'tomtom/tcomment_vim' }
  use { 'tpope/vim-vinegar' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-surround' }
  use { 'tmux-plugins/vim-tmux' }
  use { 'sheerun/vim-polyglot' }
  use { 'gpanders/editorconfig.nvim' }
  use { 'Yggdroot/indentLine' }

  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  -- NVIM implementation is slow right now... (not that much)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- All things for fast navigation, CMD+K style (,ff and others)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Git commands in nvim
  use { 'tpope/vim-fugitive' }
  -- Automatic tags management
  use { 'ludovicchabant/vim-gutentags' }
  -- Prettifier
  use { 'kyazdani42/nvim-web-devicons' }
  -- Undo as navigable tree
  use { 'mbbill/undotree' }

  -- Fancier statusline
  -- use 'itchyny/lightline.vim'
  use { 'hoob3rt/lualine.nvim' }

  -- Markdown
  use { 'davidgranstrom/nvim-markdown-preview' }

  -- LSP function signature while typing
  use { "ray-x/lsp_signature.nvim" }

  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }

  -- use {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim"
  -- }

  -- Completion
  use { 'onsails/lspkind-nvim' }   -- vscode-like pictograms to neovim
  use { 'neovim/nvim-lspconfig' }  -- Native LSP multi support
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-calc' },
      { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' },
      { 'quangnguyen30192/cmp-nvim-tags' },
      { 'ray-x/cmp-treesitter' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
      { 'rafamadriz/friendly-snippets' }
    }
  }

  -- Colorschemes
  use { 'ayu-theme/ayu-vim' }
  -- use { 'fenetikm/falcon' }
  use { 'bluz71/vim-nightfly-guicolors' }
  use { 'glepnir/zephyr-nvim' }
  use { 'hrsh7th/palenight.vim' }
  use { 'rakr/vim-one' }
  use { 'joshdick/onedark.vim' }
  use { 'frenzyexists/aquarium-vim', branch = 'develop' }
  use { 'pineapplegiant/spaceduck', branch = 'main' }
  use { 'Rigellute/rigel' }
  use { 'cocopon/iceberg.vim' }
  use { 'itchyny/landscape.vim' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'projekt0n/github-nvim-theme' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PackerBootstrap then
    require('packer').sync()
  end
end)


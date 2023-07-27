local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PackerBootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Package manager
  use { 'wbthomason/packer.nvim' }

  -- :StartupTime for debugging -- leave it commented
  -- use { 'tweekmonster/startuptime.vim' }

  -- TODO review (all)
  use { 'christoomey/vim-tmux-navigator' }
  use { 'bfredl/nvim-miniyank' }
  use { 'tpope/vim-vinegar' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-surround' }
  use { 'tmux-plugins/vim-tmux' }
  use { 'sheerun/vim-polyglot' }

  -- Show indentation guidelines
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Better folding
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }
  -- new nvim 0.9 status column configuration plugin
  -- (left column with line numbers, diagnostics, folding)
  use { 'luukvbaal/statuscol.nvim' }

  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use { 'HiPhish/nvim-ts-rainbow2' }

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
  use { 'nvim-tree/nvim-web-devicons' }
  -- Undo as navigable tree
  use { 'mbbill/undotree' }
  -- Fancy code outliner, code skimming
  use { 'stevearc/aerial.nvim' }
  -- Like aerial, but more information
  use { 'simrat39/symbols-outline.nvim' }
  -- Show key bindings while typing
  use { 'folke/which-key.nvim' }

  -- Comment helper
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end
  }

  -- Zen mode...
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  -- Auto pair brackets typing
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  -- Fancier statusline
  use { 'hoob3rt/lualine.nvim' }
  -- use { 'arkav/lualine-lsp-progress' }

  -- Markdown
  use { 'davidgranstrom/nvim-markdown-preview' }

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

  -- LSP
  use { 'neovim/nvim-lspconfig' }  -- Native LSP multi support

  -- Completion
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
  use { 'ray-x/cmp-treesitter' }
  use { 'onsails/lspkind-nvim' }   -- vscode-like pictograms to neovim
  use { 'hrsh7th/nvim-cmp'  }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'rafamadriz/friendly-snippets' }

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
  use { 'projekt0n/github-nvim-theme', tag = "v0.0.7" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PackerBootstrap then
    require('packer').sync()
  end
end)


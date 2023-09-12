return {
  -- :StartupTime for debugging -- leave it commented
  -- use { 'tweekmonster/startuptime.vim' }

  -- TODO review (all)
  { 'christoomey/vim-tmux-navigator' },
  { 'bfredl/nvim-miniyank' },
  { 'tpope/vim-vinegar' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-surround' },
  { 'tmux-plugins/vim-tmux' },
  -- { 'sheerun/vim-polyglot' },

  -- Show indentation guidelines
  { 'lukas-reineke/indent-blankline.nvim' },

  -- Better folding
  { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },

  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'HiPhish/rainbow-delimiters.nvim' },

  -- All things for fast navigation, CMD+K style (,ff and others)
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Git commands in nvim
  { 'tpope/vim-fugitive' },
  -- Automatic tags management
  { 'ludovicchabant/vim-gutentags' },
  -- Prettifier
  { 'nvim-tree/nvim-web-devicons' },
  -- Undo as navigable tree
  { 'mbbill/undotree' },
  -- Fancy code outliner, code skimming
  { 'stevearc/aerial.nvim' },
  -- Like aerial, but more information
  { 'simrat39/symbols-outline.nvim' },
  -- Show key bindings while typing
  { 'folke/which-key.nvim' },

  -- Comment helper
  { 'numToStr/Comment.nvim', config = function() require('Comment').setup({}) end, },

  -- Auto pair brackets typing
  { "windwp/nvim-autopairs" },

  -- Fancier statusline
  { 'hoob3rt/lualine.nvim' },
  -- use { 'arkav/lualine-lsp-progress' }

  -- new nvim 0.9 status column configuration plugin
  -- (left column with line numbers, diagnostics, folding)
  { 'luukvbaal/statuscol.nvim' },

  -- Markdown
  { 'davidgranstrom/nvim-markdown-preview' },

  -- LSP - Native configuration support
  { 'neovim/nvim-lspconfig' },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'ray-x/cmp-treesitter',
      { 'petertriho/cmp-git', dependencies = 'nvim-lua/plenary.nvim' },
      'onsails/lspkind-nvim',   -- vscode-like pictograms to neovim
      { 'hrsh7th/cmp-vsnip', dependencies = 'hrsh7th/vim-vsnip' },
      -- { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
    }
  },

  { 'rafamadriz/friendly-snippets' },

  -- Colorschemes
  { 'ayu-theme/ayu-vim', lazy = true },
  -- use { 'fenetikm/falcon' }
  { 'bluz71/vim-nightfly-guicolors', lazy = true },
  { 'glepnir/zephyr-nvim', lazy = true },
  { 'hrsh7th/palenight.vim', lazy = true },
  { 'rakr/vim-one', lazy = true },
  { 'joshdick/onedark.vim', lazy = true },
  { 'frenzyexists/aquarium-vim', branch = 'develop', lazy = true },
  { 'pineapplegiant/spaceduck', branch = 'main', lazy = true },
  { 'Rigellute/rigel', lazy = true },
  { 'cocopon/iceberg.vim', lazy = true },
  { 'itchyny/landscape.vim', lazy = true },
  { 'rebelot/kanagawa.nvim', lazy = true },
  { 'projekt0n/github-nvim-theme', lazy = true },
}

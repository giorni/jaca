local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Package manager
  use { 'wbthomason/packer.nvim' }

  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  -- NVIM implementation is slow right now... (not that much)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
          enable = true, -- false will disable the whole extension
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      }
    end
  }

  -- All things for fast navigation, CMD+K style (,ff and others)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git commands in nvim
  use { 'tpope/vim-fugitive' }
  -- Automatic tags management
  use { 'ludovicchabant/vim-gutentags' }
  -- Prettifier
  use { 'kyazdani42/nvim-web-devicons' }

  -- Fancier statusline
  -- use 'itchyny/lightline.vim'
  use { 'hoob3rt/lualine.nvim' }

  -- Markdown
  use { 'davidgranstrom/nvim-markdown-preview' }

  -- LSP signature while typing
  use { "ray-x/lsp_signature.nvim" }

  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- }

  -- Completion
  use { 'onsails/lspkind-nvim' }   -- vscode-like pictograms to neovim
  use { 'neovim/nvim-lspconfig' }  -- Native LSP multi support
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
      { 'octaltree/cmp-look', after = 'nvim-cmp' },
      { 'quangnguyen30192/cmp-nvim-tags', after = 'nvim-cmp' },
      { 'ray-x/cmp-treesitter', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/vim-vsnip', after = {'nvim-cmp', 'cmp-vsnip'} },
      { 'rafamadriz/friendly-snippets', after = {'nvim-cmp', 'cmp-vsnip'} },
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
        },
        preselect = cmp.PreselectMode.None,
        completion = { completeopt = "menu,menuone,noselect,noinsert" },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-c>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        },
        -- documentation = {
        --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --   winhighlight = 'FloatBorder:TelescopeBorder',
        -- },
        sources = {
          { name = 'buffer' },
          -- { name = 'tags' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'path' },
          -- { name = 'look', keyword_length=2 },
          { name = 'calc' },
          { name = 'treesitter' },
          { name = 'vsnip' },
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            menu = ({
              buffer = '[BuF]',
              nvim_lsp = '[LSP]',
              calc = '[MATH]',
              path = '[dir]',
              treesitter = '[]',
              -- look = '[Dict]',
            }),
          }),
        },
        experimental = { ghost_text = false, native_menu = false }
      }
    end
  }


  -- Colorscheme
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

  -- Out-of-the-box completion - Really good, too verbose, polluted
  -- use {
  --   'ms-jpq/coq_nvim',
  --   branch = 'coq'
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


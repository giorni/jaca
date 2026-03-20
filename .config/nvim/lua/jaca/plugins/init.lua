return {
  -- :StartupTime for debugging -- leave it commented
  -- { 'tweekmonster/startuptime.vim' }
  -- { 'sheerun/vim-polyglot' },                          -- Syntax highlighting for many languages (not tree-sitter)

  { 'christoomey/vim-tmux-navigator' },
  { 'ludovicchabant/vim-gutentags' },                     -- Automatic ctags management
  { 'nvim-tree/nvim-web-devicons' },                      -- Use nerdfont patched icons
  { 'HiPhish/rainbow-delimiters.nvim' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-fugitive' },                               -- Git commands in nvim
  { 'tpope/vim-surround' },
  { 'tpope/vim-vinegar' },                                -- netrw
  { 'tmux-plugins/vim-tmux' },                            -- syntax highlighting and other helpers when editing tmux.conf
  { 'nvim-mini/mini.align',           version = '*' },    -- helpers to align text, by delimiters (like go)
  { 'nvim-mini/mini.comment',         version = '*' },    -- Comment helper (gcc keymap)
  { 'folke/which-key.nvim',           config = true },    -- Show key bindings while typing
  { "folke/todo-comments.nvim",       opts = {} },        -- Style and show TODO style comments
  { 'nvim-lua/plenary.nvim' },                            -- plenary: extra utils for lua (everything depends on this)
  { 'nvim-tree/nvim-web-devicons' },                      -- Use nerdfont patched icons (multiple dependencies)
  -- Undo as navigable tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'UNDOTREE' }
    }
  },

  { 'j-hui/fidget.nvim' },                                -- testing
}

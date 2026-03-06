return {
  -- :StartupTime for debugging -- leave it commented
  -- { 'tweekmonster/startuptime.vim' }

  { 'christoomey/vim-tmux-navigator' },
  { 'ludovicchabant/vim-gutentags' },                     -- Automatic ctags management
  { 'nvim-tree/nvim-web-devicons' },                      -- Use nerdfont patched icons
  { 'HiPhish/rainbow-delimiters.nvim' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-fugitive' },                               -- Git commands in nvim
  { 'tpope/vim-surround' },
  { 'tpope/vim-vinegar' },                                -- netrw
  { 'tmux-plugins/vim-tmux' },                            -- syntax highlighting and other helpers when editing tmux.conf
  { 'nvim-mini/mini.align',           version = '*' }, -- helpers to align text, by delimiters (like go)
  { 'nvim-mini/mini.comment',         version = '*' }, -- Comment helper (gcc keymap)
  { 'folke/which-key.nvim',           config = true }, -- Show key bindings while typing
  { 'j-hui/fidget.nvim' },
  -- { 'sheerun/vim-polyglot' },

  -- Undo as navigable tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'UNDOTREE' }
    }
  },

  -- Style and show TODO style comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
}

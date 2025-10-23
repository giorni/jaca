return {
  -- :StartupTime for debugging -- leave it commented
  -- { 'tweekmonster/startuptime.vim' }

  -- TODO: review (all)
  { 'christoomey/vim-tmux-navigator' },
  { 'tpope/vim-vinegar' }, -- netrw
  { 'tpope/vim-abolish' },
  { 'tpope/vim-surround' },
  { 'tmux-plugins/vim-tmux' }, -- syntax highlighting and other helpers when editing tmux.conf
  { 'echasnovski/mini.align', version = '*', config = true }, -- helpers to align text, by delimiters (like go)
  { 'echasnovski/mini.comment', version = '*', config = true }, -- Comment helper (gcc keymap)
  { 'HiPhish/rainbow-delimiters.nvim' },
  -- { 'sheerun/vim-polyglot' },

  -- Git commands in nvim
  { 'tpope/vim-fugitive' },
  -- Automatic ctags management
  { 'ludovicchabant/vim-gutentags' },
  -- Use nerdfont patched icons
  { 'nvim-tree/nvim-web-devicons' },
  -- Undo as navigable tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'UNDOTREE' }
    }
  },
  -- Show key bindings while typing
  { 'folke/which-key.nvim', config = true },
  -- Style and show TODO style comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
}

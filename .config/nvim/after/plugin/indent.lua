-- This is a workaround to make first line underline work.
-- Not working without it, not perfect with.
-- vim.cmd [[highlight IndentBlanklineContextStart guisp='RainbowDelimiterRed' gui=underline]]

vim.opt.list = true
vim.opt.listchars:append 'tab:  →'

require("indent_blankline").setup {
  enabled = true,
  use_treesitter = true,
  -- use_treesitter_scope = true,
  char = '▏',
  context_char = '▏',
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
  show_current_context_start_on_current_line = true,
  -- show_end_of_line = false,
  -- show_first_indent_level = true,
  -- show_trailing_blankline_indent = false,
  context_highlight_list = {
    'RainbowDelimiterRed',
    'RainbowDelimiterOrange',
    'RainbowDelimiterYellow',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    'RainbowDelimiterBlue',
    'RainbowDelimiterViolet',
  },
  buftype_exclude = {
    'quickfix',
    'help',
    'nofile',
    'prompt',
    'terminal',
  },
  filetype_exclude = {
    '',
    'NvimTree',
    'Trouble',
    'dashboard',
    'fugitive*',
    'git*',
    'help',
    'lspinfo',
    'mason',
    'packer',
  },
}


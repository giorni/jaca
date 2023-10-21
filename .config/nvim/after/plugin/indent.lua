local highlight = {
  'RainbowDelimiterRed',
  'RainbowDelimiterYellow',
  'RainbowDelimiterBlue',
  'RainbowDelimiterOrange',
  'RainbowDelimiterGreen',
  'RainbowDelimiterViolet',
  'RainbowDelimiterCyan',
}

require("ibl").setup {
  -- context_char = '▏',
  -- space_char_blankline = ' ',
  -- show_current_context = true,
  -- show_current_context_start = true,
  -- show_current_context_start_on_current_line = true,
  -- show_end_of_line = false,
  -- show_first_indent_level = true,
  -- show_trailing_blankline_indent = false,
  indent = {
  },
  scope = {
    show_start = false,
    highlight = highlight
  },
}

-- local hooks = require "ibl.hooks"
-- hooks.register(
--   hooks.type.SCOPE_HIGHLIGHT,
--   hooks.builtin.scope_highlight_from_extmark
-- )
--

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '*',
    section_separators = ' ',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = false
  },
  sections = {
    lualine_a = {'mode', 'gutentags#statusline'},
    lualine_b = {'branch'},
    lualine_c = { {'filename', file_status = true, path = 1} },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}


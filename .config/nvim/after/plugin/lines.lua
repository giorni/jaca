-- loaded status/column modules
local lualine = require('lualine')
local statuscol = require("statuscol")

-- others
local statuscol_builtin = require("statuscol.builtin")

local filetype_ext = {
  sections = { lualine_a = { 'filetype' } },
  filetypes = { 'undotree', 'diff', 'packer' }
}

local function get_short_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local netrw_ext = {
  sections = { lualine_a = { 'filetype', get_short_cwd } },
  filetypes = { 'netrw' }
}

local lualine_config = {
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
    lualine_c = { {'filename', file_status = true, path = 1} }, -- 'lsp_progress' },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {'filename', file_status = true, path = 1} }, -- 'lsp_progress' },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename', 'diff', 'diagnostics', 'aerial'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename', 'diff', 'diagnostics', 'aerial'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  -- tabline = {
  --   lualine_a = {'buffers'},
  --   lualine_b = {'branch'},
  --   lualine_c = {'filename'},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {'tabs'}
  -- },
  tabline = {},
  extensions = {
    'aerial',
    'fugitive',
    'symbols-outline',
    'trouble',
    filetype_ext,
    netrw_ext
  }
}

-- Inserts a component in lualine_c at left section
-- local function lualine_ins_left(component)
--   table.insert(lualine_config.sections.lualine_c, component)
-- end

-- Inserts a component in lualine_x at right section and left position
local function lualine_ins_right(component)
  table.insert(lualine_config.sections.lualine_x, 1, component)
end

lualine_ins_right {
  -- Lsp server name .
  function()
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
  end,
  icon = '',
  cond = function() return next(vim.lsp.get_active_clients()) ~= nil end,
  -- color = { fg = '#ffffff', gui = 'bold' },
}

local function statuscol_buffertype(args)
  local disabled_list = { 'netrw' }
  local ft = vim.api.nvim_buf_get_option(args.buf, 'filetype')
  return not vim.tbl_contains(disabled_list, ft)
end

local statuscol_config = {
  setopt = true,
  relculright = true,
  segments = {
    {text = {"%s"}, click = "v:lua.ScSa"},
    {text = {statuscol_builtin.lnumfunc, " "}, click = "v:lua.ScLa"},
    {text = {statuscol_builtin.foldfunc}, click = "v:lua.ScFa", condition = { statuscol_buffertype }},
  }
}

lualine.setup(lualine_config)
statuscol.setup(statuscol_config)

-- local bufferline = require('bufferline')
-- bufferline.setup {}

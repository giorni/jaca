return {
  {
    'hoob3rt/lualine.nvim',
    config = function()
      local lualine = require('lualine')

      local filetype_ext = {
        sections = { lualine_a = { 'filetype' } },
        filetypes = { 'undotree', 'diff' }
      }

      local function get_short_cwd()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
      end

      local netrw_ext = {
        sections = { lualine_a = { 'filetype', get_short_cwd } },
        filetypes = { 'netrw' }
      }

      vim.cmd.colorscheme('oxocarbon')
      -- vim.cmd.colorscheme('spaceduck')
      -- vim.cmd.colorscheme('github_dark_high_contrast')
      -- require('github-theme').setup {}

      -- This is to add background color to statusline when not in focus
      local custom_theme = require'lualine.themes.auto'
      custom_theme.normal.c.bg = '#363636'
      custom_theme.inactive.c = { bg = '#232323' }
      custom_theme.normal.z.bg = custom_theme.normal.a.bg
      custom_theme.normal.z.fg = custom_theme.normal.a.fg
      custom_theme.insert.z.bg = custom_theme.insert.a.bg
      custom_theme.insert.z.fg = custom_theme.insert.a.fg
      custom_theme.visual.z.bg = custom_theme.visual.a.bg
      custom_theme.visual.z.fg = custom_theme.visual.a.fg

      local lualine_config = {
        options = {
          icons_enabled = true,
          theme = custom_theme,
          component_separators = ' ',
          section_separators = ' ',
          -- component_separators = { left = '', right = ''},
          -- section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = false,
          globalstatus = false
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'gutentags#statusline'},
          lualine_c = {{'filename', file_status = true, path = 1}},
          lualine_x = {'fileformat', 'filetype', 'encoding'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {{'filename', file_status = true, path = 1}},
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
          filetype_ext,
          netrw_ext
        }
      }


      -- Inserts a component in lualine_c at left section
      -- local function lualine_ins_left(component)
      --   table.insert(lualine_config.sections.lualine_c, component)
      -- end

      -- Inserts a component in lualine_x at right section and left position
      -- local function lualine_ins_right(component)
      --   table.insert(lualine_config.sections.lualine_x, 1, component)
      -- end

      -- Insert LSP running cog and the lsp client name
      -- lualine_ins_right {
      --   -- Lsp server name .
      --   function()
      --     -- return ''
      --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      --     local clients = vim.lsp.get_active_clients()
      --     for _, client in ipairs(clients) do
      --       local filetypes = client.config.filetypes
      --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      --         return client.name
      --       end
      --     end
      --   end,
      --   icon = '',
      --   cond = function() return next(vim.lsp.get_active_clients()) ~= nil end,
      --   -- color = { fg = '#ffffff', gui = 'bold' },
      -- }

      lualine.setup(lualine_config)
    end
  },

  {
    -- new nvim 0.9 status column configuration plugin
    -- (left column with line numbers, diagnostics, folding)
    'luukvbaal/statuscol.nvim',
    config = function()
      local statuscol = require("statuscol")
      local statuscol_builtin = require("statuscol.builtin")

      local function statuscol_buffertype(args)
        local disabled_list = { 'netrw' }
        local ft = vim.api.nvim_buf_get_option(args.buf, 'filetype')
        return not vim.tbl_contains(disabled_list, ft)
      end

      local statuscol_config = {
        setopt = true,
        relculright = true,
        segments = {
          {text = {"%s"}, click = "v:lua.ScSa"}, -- diagnostics flags at left column
          {text = {statuscol_builtin.lnumfunc, " "}, click = "v:lua.ScLa"}, -- line numbers
          {text = {statuscol_builtin.foldfunc}, click = "v:lua.ScFa", condition = { statuscol_buffertype }},
        }
      }

      statuscol.setup(statuscol_config)
    end
  }
}


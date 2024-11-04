-- NOTE: most of the comments content are just for future reference. Not deleting right now.

return {
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
    'rafamadriz/friendly-snippets', -- some already configured snippets
    -- { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snips/'

    local is_whitespace = function()
      -- returns true if the character under the cursor is whitespace.
      local col = vim.fn.col('.') - 1
      local line = vim.fn.getline('.')
      local char_under_cursor = string.sub(line, col, col)
      -- print(string.format('col="%s",line="%s",char="%s".', col, line, char_under_cursor))

      if col == 0 or string.match(char_under_cursor, '%s') then
        return true
      else
        return false
      end
    end

    -- local is_comment = function()
    --   -- uses treesitter to determine if cursor is currently in a comment.
    --   local context = require("cmp.config.context")
    --   return context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment")
    -- end

    cmp.setup {
      -- NOTE: This approach breaks all other inputs (like telescope, command) since it runs for everything
      --
      -- enabled = function()
      --   if is_comment() or is_whitespace() then
      --     return false
      --   else
      --     return true
      --   end
      -- end,

      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
        -- expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
      preselect = cmp.PreselectMode.None, -- noselect (first item)
      completion = { completeopt = "menu,menuone,noselect,noinsert" },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, }),
        -- ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, }),

        -- NOTE: this actually does nothing pratical that couldn't be changed in a simpler way.
        -- This allow tabs to avoid completion on snippets steps.
        --
        -- Leaving it just as a reference.
        -- ['<Tab>'] = function(fallback)
        --   if vim.fn['vsnip#jumpable'](1) == 1 then 
        --     -- https://github.com/neovim/neovim/blob/master/src/nvim/keycodes.h
        --     -- vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-next)', 0x80, 253, 83))
        --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-next)', true, false, true))
        --   elseif not cmp.select_next_item({ behavior = cmp.SelectBehavior.Select }) then
        --     fallback()
        --   end
        -- end,
        -- a

        -- NOTE: This partially works.

        ['<CR>'] = function(fallback)
          if not cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, }) then
            cmp.close()
            fallback()
          end
        end
      },
      -- documentation = {
      --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      --   winhighlight = 'FloatBorder:TelescopeBorder',
      -- },
      sources = cmp.config.sources({
        -- { name = 'tags' },
        -- { name = 'codeium' },
        -- { name = 'cody' },
        { name = 'nvim_lsp' },
        { name = 'supermaven' },
        { name = 'treesitter' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' }
      }, {
        { name = 'buffer' },
      }),
      window = {
        completion = {
          -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[2] and strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or strings[1] or "") .. ")"

          return kind
        end,
      },
      -- formatting = {
      --   format = lspkind.cmp_format({
      --     mode = 'symbol_text',
      --     max_width = 1,
      --     symbol_map = { Supermaven = "" },
      --     menu = ({
      --       buffer = '[Buf]',
      --       nvim_lsp = '[LS]',
      --       path = '[dir]',
      --       nvim_lua = '[nvim]',
      --       treesitter = '',
      --       codeium = "",
      --       -- supermaven = "",
      --     }),
      --   }),
      -- },
      experimental = { ghost_text = false, native_menu = false }
    }

    -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
    -- stop the completion menu from popping up when the cursor is in whitespace/just after a newline
    local first_pass = true
    cmp.setup.buffer {
      enabled = function()
        local disabled = false
        disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
        disabled = disabled or (vim.fn.reg_recording() ~= '')
        disabled = disabled or (vim.fn.reg_executing() ~= '')
        disabled = disabled or (not first_pass and is_whitespace())
        first_pass = false
        return not disabled
      end,
    }

    -- WARN: this works, but is too slow...
    -- cmp.event:on('menu_opened', function()
    --   if is_whitespace() then
    --     cmp.close()
    --   end
    -- end)

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }
      }, {
        { name = 'buffer' }
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    -- vsnip keymaps
    -- Expand
    vim.keymap.set({'i', 's'}, '<C-j>', function()
      return vim.fn['vsnip#expandable']() == 1  and '<Plug>(vsnip-expand)' or '<C-j>'
    end, { expr = true })
    -- Expand or jump ORRR jump to the next pair closing bracket (not related to vsnip)
    vim.keymap.set({'i'}, '<C-l>', function()
      return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or [[<C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a]]
    end, { expr = true, remap = true})
    vim.keymap.set({'s'}, '<C-l>', function()
      return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<C-l>'
    end, { expr = true })
    -- Jump forward or backward
    vim.keymap.set({'i', 's'}, '<Tab>', function()
      return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<Tab>'
    end, { expr = true })
    vim.keymap.set({'i', 's'}, '<S-Tab>', function()
      return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>'
    end, { expr = true })

    -- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
    -- See https://github.com/hrsh7th/vim-vsnip/pull/50
    -- nmap        s   <Plug>(vsnip-select-text)
    -- xmap        s   <Plug>(vsnip-select-text)
    -- nmap        S   <Plug>(vsnip-cut-text)
    -- xmap        S   <Plug>(vsnip-cut-text)
    -- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
    -- local vsnip_ft = vim.g.vsnip_filetypes
    -- vsnip_ft.ruby = { 'rails' }
    -- vim.g.vsnip_filetypes = vsnip_ft

    vim.g.vsnip_filetypes = { ruby = { 'rails' }}
  end
}


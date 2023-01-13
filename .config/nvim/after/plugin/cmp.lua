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
  sources = cmp.config.sources({
    -- { name = 'tags' },
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'vsnip' },
    { name = 'nvim_lua' },
    { name = 'calc' },
  }, {
    { name = 'buffer' },
  }),
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

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' } -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' }
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- This is overwritting Noice cmdline tab completion with an unglier but more complete/fast view.
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
    { name = 'cmdline' }
  })
})


local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    -- expand = function(args) require('luasnip').lsp_expand(args.body) end,
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
    { name = 'nvim_lsp' }, -- priority = 30 (some number) to tweak order
    { name = 'treesitter' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp_signature_help' }
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = ({
        buffer = '[Buf]',
        nvim_lsp = '[LS]',
        path = '[dir]',
        nvim_lua = '[nvim]',
        treesitter = '',
      }),
    }),
  },
  experimental = { ghost_text = false, native_menu = false }
}

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

-- vsnip
-- Expand
vim.keymap.set({'i', 's'}, '<C-j>', function()
  return vim.fn['vsnip#expandable']() == 1  and '<Plug>(vsnip-expand)' or '<C-j>'
end, { expr = true })
-- Expand or jump ORRR jump to the next pair closing bracket (not related to vsnip)
vim.keymap.set({'i'}, '<C-l>', function()
  return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or [[<C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a]]
end, { expr = true })
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


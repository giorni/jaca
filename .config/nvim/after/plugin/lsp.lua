local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = { 'bashls', 'tsserver', 'solargraph', 'sumneko_lua' }
-- local servers = { 'tsserver', 'ruby_lsp', 'sumneko_lua' }

vim.g.markdown_fenced_languages = {
  'ts=typescript'
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable function signature when typing
  -- require('lsp_signature').on_attach({}, bufnr)

  -- Mappings.
  local opts = { buffer=bufnr, remap=false }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'W', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
      debounce_did_change_notify = 250
    },
    on_attach = on_attach
  }
end

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lspconfig.bashls.setup {
  filetypes = { 'sh', 'zsh' }
}

-- NOT USING!!!
--
-- local configs = require("lspconfig.configs")
-- local util = require("lspconfig.util")
--
-- if not configs.ruby_lsp then
--   local enabled_features = {
--     "documentSymbols",
--     "documentHighlights",
--     "foldingRanges",
--     "selectionRanges",
--     -- "semanticHighlighting",
--     "formatting",
--     "diagnostics",
--     "codeActions",
--   }
--
--   configs.ruby_lsp = {
--     default_config = {
--       -- cmd = { "bundle", "exec", "ruby-lsp" },
--       cmd = { "ruby-lsp" },
--       filetypes = { "ruby" },
--       root_dir = util.root_pattern("Gemfile", ".git"),
--       init_options = {
--         enabledFeatures = enabled_features,
--       },
--       settings = {},
--     },
--     commands = {
--       FormatRuby = {
--         function()
--           vim.lsp.buf.format({
--             name = "ruby_lsp",
--             async = true,
--           })
--         end,
--         description = "Format using ruby-lsp",
--       },
--     },
--   }
-- end


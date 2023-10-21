local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'W', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

lspconfig.bashls.setup {
  filetypes = { 'sh', 'zsh' }
}

lspconfig.tsserver.setup {}

lspconfig.eslint.setup {}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        -- version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- After you fixed that little big problem regarding requires and load paths it seems that it is working really pretty very much good.
lspconfig.solargraph.setup {}

lspconfig.gopls.setup {}

-- lspconfig.ruby_ls.setup {}

-- This configuration works, but ruby lsp doesn't have standard library code completion
--
-- First interaction --
--
-- lspconfig.ruby_ls.setup {
--   init_options = {
--     enabledFeatures = {
--       "codeActions",
--       "diagnostics",
--       "documentHighlights",
--       "documentSymbols",
--       "formatting",
--       "inlayHint",
--
--       -- "documentLink",
--       -- "foldingRanges",
--       -- "hover",
--       -- "onTypeFormatting",
--       -- "selectionRanges",
--       -- "semanticHighlighting",
--       -- "completion"
--     }
--   },
--   on_attach = function(client, buffer)
--     -- in the case you have an existing `on_attach` function
--     -- with mappings you share with other lsp clients configs
--     pcall(on_attach, client, buffer)
--
--     local diagnostic_handler = function ()
--       local params = vim.lsp.util.make_text_document_params(buffer)
--       client.request(
--         'textDocument/diagnostic',
--         {textDocument = params},
--         function(err, result)
--           if err then
--             local err_msg = string.format("ruby-lsp - diagnostics error - %s", vim.inspect(err))
--             vim.lsp.log.error(err_msg)
--           end
--           if not result then return end
--           vim.lsp.diagnostic.on_publish_diagnostics(
--             nil,
--             vim.tbl_extend('keep', params, { diagnostics = result.items }),
--             { client_id = client.id }
--           )
--         end
--       )
--     end
--     diagnostic_handler() -- to request diagnostics when attaching the client to the buffer
--
--     local ruby_group = vim.api.nvim_create_augroup('ruby_ls', {clear = false})
--     vim.api.nvim_create_autocmd(
--       {'BufEnter', 'BufWritePre', 'InsertLeave', 'TextChanged'},
--       {
--         buffer = buffer,
--         callback = diagnostic_handler,
--         group = ruby_group,
--       }
--     )
--   end
-- }
--
-- Second interaction --
--
-- _timers = {}
-- local function setup_diagnostics(client, buffer)
--   if require("vim.lsp.diagnostic")._enable then
--     return
--   end
--
--   local diagnostic_handler = function()
--     local params = vim.lsp.util.make_text_document_params(buffer)
--     client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
--       if err then
--         local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
--         vim.lsp.log.error(err_msg)
--       end
--       if not result then
--         return
--       end
--       vim.lsp.diagnostic.on_publish_diagnostics(
--         nil,
--         vim.tbl_extend("keep", params, { diagnostics = result.items }),
--         { client_id = client.id }
--       )
--     end)
--   end
--
--   diagnostic_handler() -- to request diagnostics on buffer when first attaching
--
--   vim.api.nvim_buf_attach(buffer, false, {
--     on_lines = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--       _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
--     end,
--     on_detach = function()
--       if _timers[buffer] then
--         vim.fn.timer_stop(_timers[buffer])
--       end
--     end,
--   })
-- end
--
-- lspconfig.ruby_ls.setup({
--   on_attach = function(client, buffer)
--     setup_diagnostics(client, buffer)
--   end,
-- })
--

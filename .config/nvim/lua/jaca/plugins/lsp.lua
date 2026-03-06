return {
  'neovim/nvim-lspconfig',
  config = function()
    -- local util = require('lspconfig.util')
    -- vim.lsp.set_log_level("debug")

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
        -- local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to declaration' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Go to implementation' })
        vim.keymap.set('n', 'H', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover'})
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Signature help' })
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = 'Add workspace folder' })
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = 'Remove workspace folder' })
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = 'List workspace folders' })
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Go to type definition' })
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename symbol' })
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code action' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'References' })
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, { buffer = ev.buf, desc = 'Format buffer' })
      end,
    })

    local servers = {
      bashls = {
        filetypes = { 'sh', 'zsh' }
      },
      ts_ls = {},
      eslint = {},
      lua_ls = {
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
      },
      ruby_lsp = {
        root_markers =  { '.jj', '.git', 'Gemfile' },
      },
      rubocop = {
        root_markers =  { '.jj', '.git', 'Gemfile' },
      },
      -- After you fixed that little big problem regarding requires and load paths it seems that it is working really pretty very much good.
      -- solargraph ={
      --   root_dir = util.root_pattern('.git', 'Gemfile'),
      -- }
    }

    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}


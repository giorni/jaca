local capabilities = vim.lsp.protocol.make_client_capabilities()
local nvim_lsp = require('lspconfig')
local servers = { 'solargraph' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    flags = { debounce_text_changes = 150, }
  }
end

nvim_lsp.bashls.setup {
    capabilities = capabilities,
    filetypes = { 'sh', 'zsh' }
}

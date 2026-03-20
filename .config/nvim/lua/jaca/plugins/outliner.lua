return {
  {
    'stevearc/aerial.nvim',
    keys = { { '<leader>x', vim.cmd.AerialToggle, desc = 'Aerial (simplified symbols tree)' } },
    config = function()
      require('aerial').setup({
        backends = { 'lsp', 'treesitter', 'markdown', 'man' },
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          local opts = {buffer = bufnr}
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', opts)
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', opts)
        end
      })

      -- vim.keymap.set('n', '<leader>a', vim.cmd['AerialToggle'], { desc = 'Aerial (simplified symbols tree)' })
    end
  },

  {
    -- 'simrat39/symbols-outline.nvim',
    'hedyhli/outline.nvim',
    config = true,
    keys = {
      { '<leader>s', vim.cmd.Outline, desc = 'Toggle Symbols Tree' }
    }
  }
}


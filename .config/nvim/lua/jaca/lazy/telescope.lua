return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
  },
  config = function()
    local ts = require('telescope')
    ts.load_extension('fzy_native')
    ts.setup  {
      pickers = {
        buffers = {
          mappings = {
            n = {
              ["d"] = "delete_buffer",
            }
          }
        }
      }
}

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fm', builtin.keymaps, {})

  end
}


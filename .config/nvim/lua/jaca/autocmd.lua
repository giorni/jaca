local jaca_top = vim.api.nvim_create_augroup('jaca_top', {})

-- netrw
-- avoid netrw reload, I don't need, and it conflicts with vim and tmux navigation
vim.api.nvim_create_autocmd('FileType', {
  group    = jaca_top,
  pattern  = 'netrw',
  callback = function()
    vim.keymap.set('n', '<c-l>', vim.cmd.TmuxNavigateRight, { buffer = true })
  end,
})


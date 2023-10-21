require('jaca.set')
require('jaca.remap')

local jaca_top = vim.api.nvim_create_augroup('jaca_top', {})

-- netrw
-- avoid netrw reload, I don't need, it it conflicts with vim and tmux navigation
vim.api.nvim_create_autocmd('FileType', {
  group = jaca_top,
  pattern = 'netrw',
  callback = function()
    vim.keymap.set('n', '<c-l>', vim.cmd.TmuxNavigateRight, { buffer = true })
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('jaca.plugins', {
  -- defaults = { lazy = true },
})

-- require('github-theme').setup {}

vim.cmd.colorscheme('oxocarbon')
-- vim.cmd.colorscheme('spaceduck')
-- vim.cmd.colorscheme('github_dark_high_contrast')



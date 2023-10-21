vim.g.mapleader = ','

if (vim.fn.has("termguicolors")) then
  vim.o.termguicolors = true
end

-- general
vim.g.is_bash = 1           -- default shell syntax
vim.opt.clipboard:append { 'unnamedplus' }
vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.linebreak = true
vim.o.list = true
vim.opt.listchars:append 'tab:  →'
-- vim.o.mouse = 'a'        -- necessary?
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.showmode = false      -- not needed when cmdheight = 0
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.wrap = false

-- indent
vim.o.smartindent = true
vim.o.shiftwidth = 2   -- default indentation size, from the beginning of the line
vim.o.softtabstop = 8   -- tab KEY actual inserted spaces
vim.o.tabstop = 2      -- normal tab char spaces size, how wide in spaces to define a tab CHAR
vim.o.expandtab = true -- expand tab to spaces on insert

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- file patterns to ignore when tab completing
vim.opt.wildignore:append {
  '*.o,*.obj,*~',
  '*vim/backups*',
  '*sass-cache*',
  '*DS_Store*',
  'vendor/rails/**',
  'vendor/cache/**',
  '*.gem',
  'log/**',
  'tmp/**',
  '*.png,*.jpg,*.gif',
  'node_modules/**',
  'bower_components/**',
  'src-electron/**',
}


vim.keymap.set('n', '//', ':let @/ = ""<cr>', { silent = true }) -- Fast alias to clear /{search} hilightning with //
vim.keymap.set("n", "J", "mzJ`z") -- J (append next line up) and keep cursor at start
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- page jump and keep cursor vertically centralized
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- page jump and keep cursor vertically centralized
vim.keymap.set("n", "n", "nzzzv") -- keep search in the middle of the screen
vim.keymap.set("n", "N", "Nzzzv") -- keep search in the middle of the screen

-- vim.keymap.set("c", "cd.", "lcd %:p:h") -- command to change vim working directory to current file only on current window
vim.keymap.set("n", "cd", ":cd %:h<CR>:pwd<CR>") -- change whole vim working directory to current file

-- this is implemented at after/plugin/completion.lua, since snippet helpers are sharing this.
-- vim.keymap.set('i', '<C-l>', [[<C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a]])

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)


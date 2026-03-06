vim.keymap.set("n", "/.", ':let @/ = ""<cr>', { silent = true }) -- Fast alias to clear /{search} patterh with /.
vim.keymap.set("n", "//", ":noh<cr>", { silent = true }) -- Fast alias to clear /{search} highlightning with //
vim.keymap.set("n", "J", "mzJ`z") -- J (append next line up) and keep cursor at start
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- page jump and keep cursor vertically centralized
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- page jump and keep cursor vertically centralized
vim.keymap.set("n", "n", "nzzzv") -- keep search in the middle of the screen
vim.keymap.set("n", "N", "Nzzzv") -- keep search in the middle of the screen

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down in visual mode
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- move line up

-- vim.keymap.set("c", "cd.", "lcd %:p:h") -- command to change vim working directory to current file only on current window
vim.keymap.set("n", "cd", ":cd %:h<CR>:pwd<CR>") -- change whole vim working directory to current file

vim.keymap.set("i", "<C-l>", [[<C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a]]) -- in insert mode, move after closing token (anything like " ' } ] ) )

vim.keymap.set("v", "<leader>a", ":AlignToInitialColumn<cr>") -- Align text to the right, duh
vim.keymap.set({ "n", "v" }, "gf", ":FindFileUnderCursor<cr>") -- Find file under cursor, duh


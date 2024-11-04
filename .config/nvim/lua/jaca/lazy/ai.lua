return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-n>",
        -- clear_suggestion = "<C-]>",
        accept_word = "<C-h>",
      }
    })
  end,
}

-- return {
--   -- {
--   --   'Exafunction/codeium.vim',
--   --   config = function ()
--   --     -- Change '<C-g>' here to any keycode you like.
--   --     vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
--   --     vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
--   --     vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
--   --   end
--   -- },
--
--   {
--     "Exafunction/codeium.nvim",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "hrsh7th/nvim-cmp",
--     },
--     config = function()
--         require("codeium").setup({})
--     end
--   },
--
--   -- Leave it configured but not use right now.
--   {
--     "sourcegraph/sg.nvim",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim"
--     },
--     -- If you have a recent version of lazy.nvim, you don't need to add this!
--     -- build = "nvim -l build/init.lua",
--     config = function()
--         -- require("sg").setup({})
--     end
--   },
-- }


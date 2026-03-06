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

    vim.keymap.set('n', '<leader>fp', builtin.builtin, { desc = 'Telescope builtin' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find_files' })
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help_tags' })
    vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Telescope keymaps' })

    -- from https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/lua/config/telescope/multigrep.lua
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local conf = require "telescope.config".values

    local live_multigrep = function(opts)
      opts = opts or {}
      opts.cwd = opts.cwd or vim.uv.cwd()

      local finder = finders.new_async_job {
        command_generator = function(prompt)
          if not prompt or prompt == "" then
            return nil
          end

          local pieces = vim.split(prompt, "  ")
          local args = { "rg" }
          if pieces[1] then
            table.insert(args, "-e")
            table.insert(args, pieces[1])
          end

          if pieces[2] then
            table.insert(args, "-g")
            table.insert(args, pieces[2])
          end

          ---@diagnostic disable-next-line: deprecated
          return vim.tbl_flatten {
            args,
            { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
          }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
      }

      pickers.new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
      }):find()
    end

    vim.keymap.set("n", "<leader>fg", live_multigrep, { desc = 'Telescope live_multigrep' })
  end
}


return {
  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context', -- show context of the cursor at top of the screen
    'nvim-treesitter/nvim-treesitter-textobjects' -- enabled better navigation beginning/end of the node/function/class/etc
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "bash", "c", "javascript", "lua", "vim", "ruby", "regex", "markdown", "markdown_inline" },
      -- ignore_install = { "javascript" }, -- List of parsers to ignore installing

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        enable = true, -- false will disable the whole extension

        disable = function(lang, buf)
          -- local disabled = { 'bash', 'zsh', 'sh' }
          local disabled = {}
          for _, value in pairs(disabled) do
            if value == lang then
              return true
            end
          end

          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = { 'ruby' }
        additional_vim_regex_highlighting = false
      },

      -- Indentation based on treesitter for the = operator.
      -- NOTE: This is an experimental feature.
      indent = { enable = true },

      incremental_selection = { enable = true },

      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            ["]n"] = "@block.outer",
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
            ["]o"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            --
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope start" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold start" },
          },
          goto_next_end = {
            ["]["] = "@class.outer",
            ["]M"] = "@function.outer",
            ["]N"] = "@block.outer",
            ["]S"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
          },
          goto_previous_start = {
            ["[["] = "@class.outer",
            ["[m"] = "@function.outer",
            ["[n"] = "@block.outer",
            ["[s"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope start" },
          },
          goto_previous_end = {
            ["[]"] = "@class.outer",
            ["[M"] = "@function.outer",
            ["[N"] = "@block.outer",
            ["[S"] = { query = "@local.scope", query_group = "locals", desc = "Prev scope end" },
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
          }
        },
      },
    }

    -- workaround for ruby when next line is 'end'
    -- https://github.com/tree-sitter/tree-sitter-ruby/issues/230
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363#issuecomment-1538607633
    vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')

    require('treesitter-context').setup {}
    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = '#363636' })
  end
}


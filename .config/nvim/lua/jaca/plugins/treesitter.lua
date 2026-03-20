return {
  -- Watch https://www.youtube.com/watch?v=Jes3bD6P0To
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context', -- show context of the cursor at top of the screen
    'nvim-treesitter/nvim-treesitter-textobjects' -- enabled better navigation beginning/end of the node/function/class/etc
  },
  config = function()
    -- 1. Install parsers directly
    require('nvim-treesitter').install({
      "bash", "c", "javascript", "lua", "vim", "ruby", "regex", "markdown", "markdown_inline"
    })

    -- 2. Setup textobjects config (jumps only)
    require('nvim-treesitter-textobjects').setup({
      move = { set_jumps = true }
    })

    local function set_treesitter_textobjects()
      -- 6. Move Keymappings
      local move = require('nvim-treesitter-textobjects.move')

      -- goto_next_start
      vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function" })
      vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]n", function() move.goto_next_start("@block.outer", "textobjects") end, { desc = "Next block" })
      vim.keymap.set({ "n", "x", "o" }, "]o", function() move.goto_next_start("@loop.*", "textobjects") end, { desc = "Next loop" })
      vim.keymap.set({ "n", "x", "o" }, "]s", function() move.goto_next_start("@local.scope", "locals") end, { desc = "Next scope start" })
      vim.keymap.set({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold", "folds") end, { desc = "Next fold start" })

      -- goto_next_end
      vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "]N", function() move.goto_next_end("@block.outer", "textobjects") end, { desc = "Next block end" })
      vim.keymap.set({ "n", "x", "o" }, "]S", function() move.goto_next_end("@local.scope", "locals") end, { desc = "Next scope end" })

      -- goto_previous_start
      vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
      vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
      vim.keymap.set({ "n", "x", "o" }, "[n", function() move.goto_previous_start("@block.outer", "textobjects") end, { desc = "Prev block start" })
      vim.keymap.set({ "n", "x", "o" }, "[s", function() move.goto_previous_start("@local.scope", "locals") end, { desc = "Prev scope start" })

      -- goto_previous_end
      vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })
      vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev function end" })
      vim.keymap.set({ "n", "x", "o" }, "[N", function() move.goto_previous_end("@block.outer", "textobjects") end, { desc = "Prev block end" })
      vim.keymap.set({ "n", "x", "o" }, "[S", function() move.goto_previous_end("@local.scope", "locals") end, { desc = "Prev scope end" })

      -- goto_next / goto_previous
      vim.keymap.set({ "n", "x", "o" }, "]d", function() move.goto_next("@conditional.outer", "textobjects") end, { desc = "Next conditional" })
      vim.keymap.set({ "n", "x", "o" }, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end, { desc = "Prev conditional" })
    end

    -- 3. Autocommands for Highlighting, Indent, and File Size Limit
    local ts_augroup = vim.api.nvim_create_augroup("MyTreesitter", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = ts_augroup,
      callback = function(args)
        local buf = args.buf

        -- Return if buftype is not empty (e.g. netrw)
        if vim.bo[buf].buftype ~= "" then
          return
        end

        -- Return if parser not available
        if vim.treesitter.get_parser(buf, vim.bo[buf].filetype, { error = false }) == nil then
          print("treesitter not available")
          return
        end

        -- File size check to disable highlighting for large files
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return
        end

        -- Start highlighting
        vim.treesitter.start(buf)
        -- Enable indent
        vim.bo[buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"

        -- Configure folds
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldlevel = 99

        -- Set textobjects
        set_treesitter_textobjects()
      end,
    })

    -- 4. Ruby Workaround
    -- workaround for ruby when next line is 'end'
    -- https://github.com/tree-sitter/tree-sitter-ruby/issues/230
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363#issuecomment-1538607633
    vim.api.nvim_create_autocmd("FileType", {
      group = ts_augroup,
      pattern = "ruby",
      callback = function()
        vim.opt_local.indentkeys:remove(".")
      end,
    })

    -- 5. Context
    require('treesitter-context').setup {}
    vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = '#363636' })
  end
}


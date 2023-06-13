require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "help", "javascript", "lua", "vim", "ruby", "regex", "markdown", "markdown_inline" },
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true, -- false will disable the whole extension

    disable = function(lang, buf)
      local disabled = { 'bash', 'zsh', 'sh' }
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
    additional_vim_regex_highlighting = false,
  },

  -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
  indent = { enable = true },

  incremental_selection = { enable = true },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}


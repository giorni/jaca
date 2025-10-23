return {
  {
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
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          http = {
            gemini = function()
              return require("codecompanion.adapters").extend("gemini", {
                schema = {
                  model = {
                    -- https://ai.google.dev/gemini-api/docs/models
                    default = "gemini-2.5-pro",
                    -- default = "gemini-2.0-flash-thinking-exp",
                    -- default = "gemini-2.0-flash-thinking-exp-01-21",
                  }
                }
              })
            end
          }
        },
        strategies = {
          chat = {
            adapter = "gemini",
            opts = {
              completion_provider = "cmp",
            }
          },
          inline = {
            adapter = "gemini",
          },
        },
      })
    end
  }
}


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
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
    },
    keys = {
      { "<leader>fq", vim.cmd.CodeCompanionActions, desc = "CodeCompanion (actions)", mode = { "n", "v" } },
      { "gq", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion (chat)", mode = "v" },
      { "<leader>q", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion (chat)", mode = { "n", "v" } },
    },
    opts = {
      -- ignore_warnings = true,
      adapters = {
        http = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              schema = {
                model = {
                  -- https://ai.google.dev/gemini-api/docs/models
                  default = "gemini-3-flash-preview",
                }
              }
            })
          end,
          local_ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              env = {
                url = os.getenv("OLLAMA_API_URL") or "http://localhost:11434",
              },
              schema = {
                model = {
                  default = "qwen3-coder-next:latest",
                },
              },
            })
          end,
          -- opencode_remote = function()
          --   return require("codecompanion.adapters").extend("opencode", {
          --     env = {
          --       url = os.getenv("OPENCODE_API_URL") or "http://localhost:4096",
          --     },
          --     schema = {
          --       model = {
          --         default = "qwen3-coder-next:latest",
          --       },
          --     },
          --   })
          -- end
        }
      },
      interactions = {
        chat = {
          adapter = "local_ollama",
          opts = {
            completion_provider = "cmp",
          }
        },
        inline = {
          adapter = "local_ollama",
        },
        cmd = {
          adapter = "local_ollama",
        },
        background = {
          adapter = "local_ollama",
        },
      },
      display = {
        action_palette = {
          -- prompt = "Prompt ", -- Prompt used for interactive LLM calls
          provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_preset_actions = true, -- Show the preset actions in the action palette?
            show_preset_prompts = true, -- Show the preset prompts in the action palette?
            title = "CodeCompanion actions", -- The title of the action palette
          },
        },
      },
    }
  }
}


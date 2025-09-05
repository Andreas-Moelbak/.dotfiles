return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local cc = require("codecompanion")
    cc.setup({
      adapters = {
        http = {
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              schema = {
                model = {
                  default = "gpt-4o-mini", -- or gpt-4o, gpt-3.5-turbo
                },
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        },
        commit = {
          adapter = "openai",
          opts = {
            prompt = [[
              Write a clear, concise, and conventional commit message
              based on the following staged git diff:
            ]],
          },
        },
      },
    })
  end,
}

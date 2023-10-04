return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/popup.nvim",
        {
        "nvim-telescope/telescope-fzy-native.nvim",
        build = "make"
        },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files in project" },
      { "<leader>pg",  "<cmd>Telescope live_grep<cr>", desc = "Find string in project" },
      -- Buffers
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- search
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },

    },
    config = function()
        require "telescope".setup {
            --[[
            defaults = {
                layout_config = {
                    vertical = { width = 0.5 }
                    -- other layout configuration here
                },
                -- other defaults configuration here
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                }
            },
            --]]
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                },
            },
            border = false
        }
    -- load extensions
    require"telescope".load_extension("fzy_native")
    end
}

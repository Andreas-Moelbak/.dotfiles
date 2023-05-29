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
      { "<Leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files in project" },
      { "<Leader>pg",  "<cmd>Telescope live_grep<cr>", desc = "Find string in project" },
    },
    config = function()
    require "telescope".setup {
        extensions = {
            file_browser = {
                hijack_netrw = true,
            },
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

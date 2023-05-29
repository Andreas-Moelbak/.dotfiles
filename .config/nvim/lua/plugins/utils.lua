return {
    -- Nedded for everrything
    { "nvim-lua/plenary.nvim", lazy = true, },
    { "nvim-tree/nvim-web-devicons", lazy = true, },

    -- Neat undoo tree
    {
        "mbbill/undotree",
        keys = {
            {"<leader>u", vim.cmd.UndotreeToggle}
        }
    },
}

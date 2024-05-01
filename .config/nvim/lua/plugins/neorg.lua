return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    },
    {
        "nvim-neorg/neorg",
        --dependencies = { "luarocks.nvim" },
        dependencies = {
            "luarocks.nvim",
            "nvim-neorg/neorg-telescope"
        },
        -- put any other flags you wanted to pass to lazy here!
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.ui"] = {},
                    ["core.ui.calendar"] = {},
                    ["core.tempus"] = {},

                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/notes/work",
                                home = "~/notes/personal",
                            }
                        },
                    },

                    ["core.integrations.telescope"] = {},

                    ["core.concealer"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },

                    ["core.export"] = {},
                    ["core.export.markdown"] = {
                        config = {
                            extensions = "all",
                        },
                    },
                }

            })
        end,
    }
}

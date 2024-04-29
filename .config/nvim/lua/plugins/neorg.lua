return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = "nvim-neorg/neorg-telescope",
    cmd = "Neorg",
    ft = "norg",
    opts = {
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
    }
}

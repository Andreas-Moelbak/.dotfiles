local ok, neorg = pcall(require, 'neorg')

neorg.setup {
    load = {
        ["core.defaults"] = {},

        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/personal",
                }
            },
        },

        ["core.integrations.telescope"] = {},

        ["core.norg.concealer"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
            -- Configuration here
            }
        },

        ["core.norg.completion"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                engine = "nvim-cmp"
            }
        }
    }
}

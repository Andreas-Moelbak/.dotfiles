local ok, neorg = pcall(require, 'neorg')
if not ok then
    return
end


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

        ["core.norg.concealer"] = {},

        ["core.norg.completion"] = {
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

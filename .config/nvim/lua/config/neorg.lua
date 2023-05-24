local ok, neorg = pcall(require, 'neorg')
if not ok then
    return
end


neorg.setup {
    load = {
        ["core.defaults"] = {},

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

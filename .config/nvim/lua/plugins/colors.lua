return {
    {
        "rebelot/kanagawa.nvim",
        lazy = true
    },
    {
        "sainnhe/sonokai",
        lazy = true
    },

    {
        "sainnhe/edge",
        lazy = true
    },

    {
        "sainnhe/everforest",
        lazy = true
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            on_highlights = function(hl, c)
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
            end,
        }
    },
    {"EdenEast/nightfox.nvim",
        lazy = true
    },
    {"rose-pine/neovim",
        --lazy = true
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        opts = {
            flavour = "latte"
        },
    },
}

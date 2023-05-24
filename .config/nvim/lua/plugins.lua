local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "glewis6991/gitsigns.nvimit",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require("lazy").setup({

    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
        -- build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    },

    --"nvim-lualine/lualine.nvim",
    -- Lsp installer and config
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    --null-ls
    "jose-elias-alvarez/null-ls.nvim",

    -- Completetion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    --"rafamadriz/friendly-snippets",

    --[[
    {
        "stevearc/oil.nvim",
        config = function()
        require("oil").setup()
        end
    },
    --]]

    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzy-native.nvim",
        build = "make"
    },

    "lukas-reineke/indent-blankline.nvim",
    "mbbill/undotree",

    -- Note stuff
    -- Neorg
    {
        "nvim-neorg/neorg",
        build = "Neorg sync-parsers",
        config = function()
            require("config.neorg")
        end,
        dependencies = "nvim-neorg/neorg-telescope",
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    -- * a function that returns the width or the height
                    width = 120, -- width of the Zen window
                    height = 1, -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        relativenumber = false, -- disable relative numbers
                        -- cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    },
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function(win)
                    vim.cmd('IndentBlanklineDisable')
                end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                    vim.cmd('IndentBlanklineEnable')
                end,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    -- Git stuff
    {
    'TimUntersberger/neogit',
        config = function()
            require("config.neogit")
        end,
    },
    'sindrets/diffview.nvim',
    {
    'lewis6991/gitsigns.nvim',
        config = function()
            require("config.gitsigns")
        end,
    },

    'jpalardy/vim-slime',

    -- Colorschemes
    "rebelot/kanagawa.nvim",
    "sainnhe/sonokai",
    "sainnhe/edge",
	"sainnhe/everforest",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    "rose-pine/neovim",
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
})

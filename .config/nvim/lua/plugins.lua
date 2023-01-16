local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
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

    "nvim-lualine/lualine.nvim",
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
        config = function()
            require("config.neorg")
        end,
        dependencies = "nvim-neorg/neorg-telescope",
    },
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("config.zk-nvim")
        end,
        dependencies = "nvim-telescope/telescope.nvim" ,
    },

    -- Git stuff
    --'TimUntersberger/neogit',
    --'sindrets/diffview.nvim',

    'jpalardy/vim-slime',

    -- Colorschemes
    "sainnhe/sonokai",
    "sainnhe/edge",
	"sainnhe/everforest",
    "folke/tokyonight.nvim",
})

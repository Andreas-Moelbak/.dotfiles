return require("packer").startup(function(use)
    -- Package manager
    use { "wbthomason/packer.nvim" }

    use { "nvim-lua/plenary.nvim" }
    use { "nvim-tree/nvim-web-devicons" }

    use {
        'lewis6991/impatient.nvim',
        config = function() require('impatient') end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
        -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use { "nvim-lualine/lualine.nvim" }
    -- Lsp installer and config
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }

    --null-ls
    use { "jose-elias-alvarez/null-ls.nvim" }

    -- Completetion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }

    use { "L3MON4D3/LuaSnip" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }


	use { "nvim-lua/plenary.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "nvim-telescope/telescope.nvim" }
	use { "nvim-telescope/telescope-fzy-native.nvim"}
    use { "L3MON4D3/LuaSnip",
        tag = "v<CurrentMajor>.*"
    }
    use { "rafamadriz/friendly-snippets" }

    use { "nvim-lua/popup.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzy-native.nvim",
        run = "make"
    }

    use { "lukas-reineke/indent-blankline.nvim" }
    use { "mbbill/undotree" }

    -- Colorschemes
    use { "sainnhe/sonokai" }
    use { "sainnhe/edge" }
	use { "sainnhe/everforest" }
    use { "folke/tokyonight.nvim" }
end)

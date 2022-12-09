return require("packer").startup(function()
    -- Package manager
    use { "wbthomason/packer.nvim" }

<<<<<<< HEAD
=======
    use { "nvim-lua/plenary.nvim" }

    use {
        'lewis6991/impatient.nvim',
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
        -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

>>>>>>> 55b2c29 (yes)
    -- Lsp installer and config
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "neovim/nvim-lspconfig" }

<<<<<<< HEAD
=======
    --null-ls
    use { "jose-elias-alvarez/null-ls.nvim" }

>>>>>>> 55b2c29 (yes)
    -- Completetion
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }

<<<<<<< HEAD
    use { "L3MON4D3/LuaSnip" }
 --   use { "saadparwaiz1/cmp_luasnip" }
  --  use { "rafamadriz/friendly-snippets" }


	use { "nvim-lua/plenary.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "nvim-telescope/telescope.nvim" }
	use { "nvim-telescope/telescope-fzy-native.nvim",
=======
    use { "L3MON4D3/LuaSnip",
        tag = "v<CurrentMajor>.*"
    }
    use { "rafamadriz/friendly-snippets" }

    use { "nvim-lua/popup.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-fzy-native.nvim",
>>>>>>> 55b2c29 (yes)
        run = "make"
    }

	use {"nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
        -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

<<<<<<< HEAD
    -- colorschemes
	use { "sainnhe/sonokai" }
	use { "sainnhe/edge" }
	use { "sainnhe/everforest" }
=======
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "mbbill/undotree" }

    -- Orgmode
    --[use {
    --"nvim-neorg/neorg",
    --ft = "norg",
    --after = "nvim-treesitter",
    --}

    -- Colorschemes
    use { "sainnhe/sonokai" }
    use { "sainnhe/edge" }
    use { "folke/tokyonight.nvim" }
>>>>>>> 55b2c29 (yes)
end)

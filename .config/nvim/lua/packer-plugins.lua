return require("packer").startup(function()
    use "wbthomason/packer.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"


	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-telescope/telescope.nvim"
	use { "nvim-telescope/telescope-fzy-native.nvim", 
        run = "make"
    }

	use "neovim/nvim-lspconfig"

	use {"nvim-treesitter/nvim-treesitter",
        -- run = ":TSUpdate"
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- colorschemes
	use "sainnhe/sonokai"
end)

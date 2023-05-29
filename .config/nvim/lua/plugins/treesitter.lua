return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"python", "lua", "html"},
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                disable = true,
            },
        }
    end
}

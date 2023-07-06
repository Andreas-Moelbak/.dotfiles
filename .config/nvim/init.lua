-- Bootstrap plugin manager
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

-- Leader and localleader set as early as posible for Neorg
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- add luarocks modules to nvim path & cpath
require("setup-luarocks")

-- load plugins
require("lazy").setup({
    spec = "plugins",
    performance = {
        rtp = {
            disabled_plugins = {
                -- "netrwPlugin",
                "gzip",
                "matchit",
                "matchparen",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
-- load editor config and keymappings
require("set")
require("keymap")

-- set colorscheme
--vim.g.my_colorscheme = "catppuccin"
--vim.g.my_colorscheme = "kanagawa"
vim.g.my_colorscheme = "tokyonight-night"
vim.cmd("colorscheme " .. vim.g.my_colorscheme)

vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

--vim.opt.cmdheight = 0
vim.opt.fillchars = "fold: "

vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.wrapscan = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autoread = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-s>", vim.cmd.w, {noremap = true, silent = true})
vim.keymap.set("n", "<Leader>ng", vim.cmd.Neogit)

local M = {}

function Bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = Bind("n", {noremap = false})
M.imap = Bind("i", {noremap = false})
M.nnoremap = Bind("n")
M.vnoremap = Bind("v")
M.xnoremap = Bind("x")
M.inoremap = Bind("i")

return M



--vim.cmd('IndentBlanklineDisable')
--
--vim.opt.conceallevel = 2
--vim.opt.wrap = true
--vim.opt.linebreak = true
--vim.opt.showbreak = "↪"
--vim.opt.columns = 100
--
--
-- after/ftplugin/markdown.lua
-- Save original values in a table
local original_opts = {}

local markdown_opts = {
    conceallevel = 2,
    wrap = true,
    linebreak = true,
    showbreak = "↪",
    columns = 100,
}

-- Function to apply Markdown settings
local function apply_markdown_opts()
    -- Save original values
    original_opts.conceallevel = vim.o.conceallevel
    original_opts.wrap = vim.wo.wrap
    original_opts.linebreak = vim.wo.linebreak
    original_opts.showbreak = vim.wo.showbreak
    original_opts.columns = vim.o.columns

    -- Apply Markdown options
    vim.o.conceallevel = markdown_opts.conceallevel
    vim.wo.wrap = markdown_opts.wrap
    vim.wo.linebreak = markdown_opts.linebreak
    vim.wo.showbreak = markdown_opts.showbreak
    vim.o.columns = markdown_opts.columns
end

-- Function to restore original values
local function restore_opts()
    if next(original_opts) then
        vim.o.conceallevel = original_opts.conceallevel
        vim.wo.wrap = original_opts.wrap
        vim.wo.linebreak = original_opts.linebreak
        vim.wo.showbreak = original_opts.showbreak
        vim.o.columns = original_opts.columns
        original_opts = {} -- clear after restoring
    end
end

-- Apply settings when entering Markdown buffer
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = apply_markdown_opts,
})

-- Restore settings when leaving Markdown buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = restore_opts,
})

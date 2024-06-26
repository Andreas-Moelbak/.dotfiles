return {
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('gitsigns').setup{}
        end,
    },
    {
        'sindrets/diffview.nvim',
        cmd = "DiffviewOpen"
    },
    {
        --'TimUntersberger/neogit',
        'NeogitOrg/neogit',
        cmd = "Neogit",
        keys = {
            { "<Leader>ng", "<cmd>Neogit<cr>", desc = "Find files in project" },
        },
        config = function()
            require("neogit").setup {
                --disable_signs = false,
                --disable_hint = false,
                --disable_context_highlighting = false,
                --disable_commit_confirmation = false,
                -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
                -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
                --auto_refresh = true,
                --disable_builtin_notifications = false,
                --use_magit_keybindings = false,
                -- Change the default way of opening neogit
                kind = "replace",
                -- Change the default way of opening the commit popup
                commit_popup = {
                    kind = "split",
                },
                -- Change the default way of opening popups
                popup = {
                    kind = "split",
                },
                -- customize displayed signs
                --signs = {
                    -- { CLOSED, OPENED }
                    --section = { ">", "v" },
                    --item = { ">", "v" },
                    --hunk = { "", "" },
                --},
                --integrations = {
                    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
                    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
                    --diffview = true
                --},
                -- Setting any section to `false` will make the section not render at all
                --sections = {
                    --untracked = {
                        --folded = true
                    --},
                    --unstaged = {
                        --folded = false
                    --},
                    --staged = {
                        --folded = false
                    --},
                    --stashes = {
                        --folded = true
                    --},
                    --unpulled = {
                        --folded = true
                    --},
                    --unmerged = {
                        --folded = false
                    --},
                    --recent = {
                        --folded = true
                    --},
                --},
            }
        end
    }
}

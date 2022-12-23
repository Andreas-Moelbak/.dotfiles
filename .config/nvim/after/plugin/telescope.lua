local Remap = require("keymap")
local nnoremap = Remap.nnoremap

require "telescope".setup {
  extensions = {
    file_browser = {
        hijack_netrw = true,
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  }
}

-- load extensions
require"telescope".load_extension("fzy_native")
local builtin = require"telescope.builtin"

-- Keymaps
vim.keymap.set("n", "<Leader>pf", function() builtin.find_files() end)
vim.keymap.set("n", "<Leader>pg", function() builtin.live_grep() end)
vim.keymap.set("n", "<Leader>ch", function() builtin.command_history() end)

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
-- require"telescope".load_extension("file_browser")

-- Keymaps
nnoremap("<Leader>ff", function() 
    require('telescope.builtin').find_files()
end)

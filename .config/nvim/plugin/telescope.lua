local Remap = require("keymap")
local nnoremap = Remap.nnoremap


require "telescope".setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  }
}

require"telescope".load_extension("fzy_native")

-- Keymaps

nnoremap("<Leader>ff", function() 
    require('telescope.builtin').find_files()
end)



local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  -- b.formatting.prettier,
  b.formatting.prettierd,
  b.formatting.black.with { extra_args = { "--fast" } },
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.flake8,
  --b.diagnostics.yamllint,

  -- code actions
  --b.code_actions.gitsigns,
  --b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}

nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    root_dir = nls_utils.root_pattern ".git",
}

vim.api.nvim_set_keymap("n", "<leader>fl", ":lua vim.lsp.buf.format()<CR>", {noremap = true, silent = true})

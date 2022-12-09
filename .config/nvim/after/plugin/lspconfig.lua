local Remap = require('keymap')
local nnoremap = Remap.nnoremap

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig").pyright.setup{
   capabilities = capabilities,
  debounce_text_changes = 150,
}

require("lspconfig").powershell_es.setup{
   capabilities = capabilities,
  bundle_path = '/opt/PowerShellEditorServices',
}

require("lspconfig").gopls.setup{
  capabilities = capabilities,
  debounce_text_changes = 150,
}

require'lspconfig'.sumneko_lua.setup {
   capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Keymapings
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<Leader>gd", vim.lsp.buf.definition)
nnoremap("<Leader>r", vim.lsp.buf.rename)

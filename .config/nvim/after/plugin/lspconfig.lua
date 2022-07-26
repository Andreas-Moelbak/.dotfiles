local Remap = require('keymap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig").pyright.setup{
  capabilities = capabilities,
}

require("lspconfig").powershell_es.setup{
  capabilities = capabilities,
  bundle_path = '/opt/PowerShellEditorServices',
}

require("lspconfig").html.setup{
  capabilities = capabilities,
}

-- Keymapings
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<Leader>gd", vim.lsp.buf.definition)
nnoremap("<Leader>r", vim.lsp.buf.rename)

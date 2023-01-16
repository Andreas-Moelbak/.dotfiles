-- Setup lspconfig.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- vim.lsp.set_log_level 'trace'

-- Keymapings
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)

lspconfig.pyright.setup{
  capabilities = capabilities,
}

lspconfig.bashls.setup{
  capabilities = capabilities,
}

lspconfig.powershell_es.setup{
  capabilities = capabilities,
  bundle_path = '~/.opt/PowerShellEditorServices',
}

lspconfig.gopls.setup{
  capabilities = capabilities,
  debounce_text_changes = 150,
}

lspconfig.yamlls.setup{
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                kubernetes = "*.yaml",
            }
        }
    }
}

lspconfig.sumneko_lua.setup {
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

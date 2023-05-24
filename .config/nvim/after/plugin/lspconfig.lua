-- Setup lspconfig.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--vim.lsp.set_log_level 'trace'

-- Keymapings
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>i", ":lua vim.diagnostic.open_float(nil, {focus=false})<CR>")

lspconfig.terraformls.setup{
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
}

lspconfig.ansiblels.setup{
  capabilities = capabilities,
}

lspconfig.pyright.setup{
  capabilities = capabilities,
}

lspconfig.bashls.setup{
  capabilities = capabilities,
}

lspconfig.powershell_es.setup{
  capabilities = capabilities,
  bundle_path = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services"
}

lspconfig.gopls.setup{
  capabilities = capabilities,
  debounce_text_changes = 150,
}

lspconfig.yamlls.setup{
    capabilities = capabilities,
    settings = {
        yaml = {
            completion = {
                enabled = true
            },
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            },
            schemas = {
                kubernetes = "*.k8s.yaml",
                ["https://json.schemastore.org/prometheus.json"] = "*/prometheus.yml",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {"*/docker-compose.yml", "*/docker-compose.yaml"}
            }
        }
    }
}

lspconfig.dockerls.setup{}

lspconfig.lua_ls.setup {
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
        checkThirdParty = false, -- Disable anoying popup
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "pyright", "lua_ls", "gopls"}
        }
    },
    {
        "neovim/nvim-lspconfig",
        keys = {
			{"K", vim.lsp.buf.hover},
			{"<Leader>gd", vim.lsp.buf.definition},
			{"<Leader>rn", vim.lsp.buf.rename},
			{"<leader>i", ":lua vim.diagnostic.open_float(nil, {focus=false})<CR>"},
        },
        config =
            function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            --vim.lsp.set_log_level 'trace'

            -- Keymapings

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

        end
    },

    {
        --null-ls
        "jose-elias-alvarez/null-ls.nvim",
        keys = {
            {"<leader>fl", ":lua vim.lsp.buf.format()<CR>", silent = true}
        },
        config = function()
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
                b.formatting.xmlformat,
                b.formatting.black.with { extra_args = { "--fast" } },
                with_root_file(b.formatting.stylua, "stylua.toml"),

                -- diagnostics
                b.diagnostics.flake8,
                b.diagnostics.yamllint,

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
        end
    }
}

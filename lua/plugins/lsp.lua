return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(client, bufnr)
            end

            local servers = { "basedpyright", "lua_ls", "ruff", "bashls" }

            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }

                -- CUSTOM FOR VIM.API
                if server == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
                            diagnostics = { globals = { 'vim' } },                             -- evita warnings de vim
                            workspace = { library = vim.api.nvim_get_runtime_file("", true) }, -- autocompletado vim.api
                            telemetry = { enable = false },
                            format = { enable = true }
                        },
                    }
                end

                if server == "bashls" then
                    opts.cmd = { "bash-language-server", "start" }
                    opts.filetypes = { "sh", "bash" }
                    opts.single_file_support = true
                    opts.settings = {
                        bashIde = { globPattern = "*@(.sh|.inc|.bash|.command)" }
                    }
                end


                if server == "ruff" then
                    opts.init_options = {
                        settings = {
                            format = {
                                enabled = true,
                            },
                            organizeImports = true, -- remov if not works
                            fixAll = true,          -- remove if not works
                            loglevel = "error",
                        }
                    }
                end

                vim.lsp.config(server, opts)
                vim.lsp.enable(server)
            end
        end,
    },
}

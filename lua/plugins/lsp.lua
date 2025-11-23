return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        -- Aquí puedes poner tus keymaps LSP si quieres
      end

      local servers = { "basedpyright", "lua_ls", "ruff" }

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
              diagnostics = { globals = { 'vim' } }, -- evita warnings de vim
              workspace = { library = vim.api.nvim_get_runtime_file("", true) }, -- autocompletado vim.api
              telemetry = { enable = false },
            }
          }
        end


        if server == "ruff" then
          opts.init_options = {
            settings = {
              format = {
                enabled = true,
              },
            },
          }
        end

        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end
    end,
  },
}

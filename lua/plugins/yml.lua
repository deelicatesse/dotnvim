--[[return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
  sources = {
    null_ls.builtins.formatting.yamlfix.with({
    filetypes = { "yaml", "yml" },
    extra_args = { "--sequence-style", "block" }, -- FOR DOCKER
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
    })
  end,
}
--]]
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        require("mason-null-ls").setup({
            ensure_installed = { "ruff", "yamlfix", "shfmt" },
            automatic_installation = true,
        })

        local sources = {
            -- YAML formatter
            null_ls.builtins.formatting.yamlfix.with({
                filetypes = { "yaml", "yml" },
                extra_args = { "--sequence-style", "block" },
            }),

            -- Ruff formatter + diagnostics
            require("none-ls.formatting.ruff"),
            require("none-ls.formatting.ruff_format"),
            require("none-ls.diagnostics.ruff"),

            -- stylua formatter
            --null_ls.builtins.formatting.stylua,

            -- BASHLS formatter
            null_ls.builtins.formatting.shfmt,


        }

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}

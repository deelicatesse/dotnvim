vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd("syntax on")

-- GLOBAL THEME
vim.opt.termguicolors = true
--vim.cmd("colorscheme wildcharm") DEFAULT THEME VIM
vim.cmd([[colorscheme brutalist]])


-- GOOLORD
vim.cmd([[highlight AlphaHeader guifg=#ff5555]])

-- YAML
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = true
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.expandtab = true
    end,
})

--AUTOINDENT .LUA
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "lua",
--  callback = function()
--    vim.opt_local.shiftwidth = 2
--    vim.opt_local.tabstop = 2
--    vim.opt_local.expandtab = true
--  end,
--})

-- CONF INDENT BLANKLINE
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1A1A1A", nocombine = true })


-- FORMATTER lua_ls
-- Formateo al guardar con cualquier LSP que soporte formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- HELPER BASH
-- Activa bashls solo cuando abras un buffer sh
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
        vim.lsp.enable("bashls")
    end,
})

-- HELPER LUA LSP ERROR
--vim.lsp.start({
--    name = "lua_ls",
--    cmd = { vim.fn.stdpath("data") .. "/mason/packages/lua-language-server/libexec/bin/lua-language-server" },
--    root_dir = vim.fs.root(vim.api.nvim_buf_get_name(0), { ".git", ".luarc.json", ".luacheckrc", ".stylua.toml" })
--        or vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
--    single_file_support = true,
--    settings = {
--        Lua = {
--            diagnostics = { globals = { "vim" } },
--        },
--    },
--
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.lua" },
    callback = function(args)
        vim.lsp.start({
            name = "lua_ls",
            cmd = { vim.fn.stdpath("data") .. "/mason/packages/lua-language-server/libexec/bin/lua-language-server" },
            root_dir = vim.fs.root(vim.api.nvim_buf_get_name(args.buf),
                    { ".git", ".luarc.json", ".luacheckrc", ".stylua.toml" })
                or vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
            single_file_support = true,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })
    end,
})

--})

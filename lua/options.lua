vim.opt.nu = true
vim.opt.relativenumber = true
vim.cmd("syntax on")

-- GLOBAL THEME
vim.opt.termguicolors = true
--vim.cmd("colorscheme wildcharm") DEFAULT THEME VIM
vim.cmd([[colorscheme custom]])


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

-- AUTOINDENT .LUA
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})


-- MARKDONW

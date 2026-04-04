--[[
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "yaml", "sql", "html", "lua", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end,
}
--]]
-- UPDATE TO VERSION 0.12.0
-- ENSURE TO INSTALL treesitter-cli via npm 
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", --  <------ agrega esto
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
    -- remove if not works
   init = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)

                -- Enable treesitter-based indentation
                vim.bo.indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,

}

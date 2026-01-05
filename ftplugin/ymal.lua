-- Ajustes básicos de indentación
vim.opt_local.cursorcolumn = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- Folding por indentación
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldlevel = 1

-- Keymaps para navegar bloques por indentación
vim.api.nvim_buf_set_keymap(
  0, "n", "]]",
  ":lua require('user_functions.yaml_helper').goto_next_same_indent()<CR>",
  { noremap = true, silent = true, desc = "Next block same indent" }
)
vim.api.nvim_buf_set_keymap(
  0, "n", "[[",
  ":lua require('user_functions.yaml_helper').goto_prev_same_indent()<CR>",
  { noremap = true, silent = true, desc = "Prev block same indent" }
)

-- Navegación entre folds
vim.api.nvim_buf_set_keymap(
  0, "n", "zj",
  ':lua require("user_functions.navigate_folds").NavigateFold("j")<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_buf_set_keymap(
  0, "n", "zk",
  ':lua require("user_functions.navigate_folds").NavigateFold("k")<CR>',
  { noremap = true, silent = true }
)

-- LSP yamlls con esquemas para Ansible, Docker Compose y opcional Kubernetes
require("lspconfig").yamlls.setup {
  settings = {
    yaml = {
      format = { enable = true },
      schemas = {
        -- Ansible
        ["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/**/*.{yml,yaml}",
        -- Docker Compose
        ["https://json.schemastore.org/compose.json"] = "docker-compose*.{yml,yaml}",
        -- Kubernetes (opcional)
        kubernetes = "k8s-*.yaml",
      },
    },
  },
}


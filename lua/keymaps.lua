-- LEADER
vim.g.mapleader = " "

-- BASICS
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "save file" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { desc = "quick exit" })

-- TELESCOPE
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

-- TREE
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- BUFFERLINE
--vim.opt.termguicolors = true --bufferline

-- OPEN BELOW TERMINAL
vim.keymap.set("n", "<leader>t", function()
    local term_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
            term_buf = buf
            break
        end
    end

    if term_buf then
        vim.api.nvim_buf_delete(term_buf, { force = true }) -- cierra el terminal
    else
        vim.cmd("botright split | terminal")                -- abre abajo
    end
end, { desc = "Toggle terminal abajo" })


-- EXECUTE CURRENT .py
vim.keymap.set("n", "<leader>r", function()
    local filename = vim.fn.expand("%:p") -- ruta completa del archivo actual
    local output = vim.fn.system({ "python3", filename })

    -- Mostrar solo la salida del programa en un buffer flotante
    vim.notify(output, vim.log.levels.INFO, { title = "Salida Python" })
end, { desc = "Ejecutar archivo Python" })


-- EXECUTE CURRENT .lua
vim.keymap.set("n", "<leader>l", ":!lua %<CR>", { noremap = true, silent = true })


--- TREESITTER
--local ts_select = require("nvim-treesitter.incremental_selection")
vim.keymap.set("n", "vv", function() ts_select.init_selection() end)
vim.keymap.set("n", "vn", function() ts_select.node_incremental() end)
vim.keymap.set("n", "vm", function() ts_select.node_decremental() end)

-- RUFF

-- Mover entre splits con Alt + h/j/k/l
-- MOVE WINDOWS
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "left" })  --h
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "right" }) --j
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "down" })  --k
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "up" })    --l
--TAB
vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "tab windows" })

-- Alt + DIR
-- Mover entre splits desde terminal con Alt + dirección
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: izquierda" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: derecha" })
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: abajo" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: arriba" })

-- MICROPYTHON
--vim.keymap.set("n", "<leader>mr", require("micropython_nvim").run)


--BUFFER
vim.keymap.set("n", "<leader>v", ":vsplit")
vim.keymap.set("n", "<leader>s", ":split")

-- KULALA
-- keymaps separados y seguros
vim.keymap.set("n", "<leader>hh", function()
    local ok, kulala = pcall(require, "kulala")
    if ok then kulala.run() end
end, { desc = "Send HTTP request" })

vim.keymap.set("n", "<leader>ha", function()
    local ok, kulala = pcall(require, "kulala")
    if ok then kulala.run_all() end
end, { desc = "Send all HTTP requests" })

vim.keymap.set("n", "<leader>hs", function()
    local ok, kulala = pcall(require, "kulala")
    if ok then kulala.open_scratchpad() end
end, { desc = "Open HTTP scratchpad" })

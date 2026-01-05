-- RESET TO LOAD THEME
vim.cmd("hi clear")
if vim.fn.exists("syntax on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "brutalist" -- SET NAME

-- PALETTE COLORS
local fg = "#c0d0e8"
local bg = "#080810"
local dim = "#99a9bf"
local border = "#A0B4DC"
local code = "#c0d0e8"
local codebg = "#0E1116"
local commet = "#797979"     --"#767676" --"#121212"
local linenr = "#3B3B3B"
local lightwhite = "#CAD6EB" --"#EDF1F8"
local statusline = "#2C2C2C"
-- HIGHLIGHTS
local set = vim.api.nvim_set_hl

-- BACKGROUND
set(0, "Normal", { fg = fg, bg = bg })
-- COMMENTS
set(0, "Comment", { fg = commet, italic = true })

-- LINES AND NUMBERS
set(0, "LineNr", { fg = linenr })
set(0, "CursorLineNr", { fg = fg, bold = true })
set(0, "CursorLine", { bg = "#0A0A12" })

-- BORDERS
set(0, "FloatBorder", { fg = border, bg = bg })
set(0, "WinSeparator", { fg = border })

-- CODE
set(0, "Visual", { bg = dim })
set(0, "CodeBlock", { fg = codebg, bg = codebg })
set(0, "String", { fg = fg })
set(0, "Identifier", { fg = fg })
set(0, "Keyword", { fg = fg })
set(0, "Function", { fg = fg })

-- PLEGADO
set(0, "Folted", { fg = dim, bg = bg })


-- MARKDOWN
for i = 1, 6 do
    vim.api.nvim_set_hl(0, "RenderMarkdownH" .. i .. "Bg", { bg = bg })
end
vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = bg })
vim.api.nvim_set_hl(0, "RenderMarkdownInlineCode", { bg = bg })

-- HELPERS
vim.api.nvim_set_hl(0, "Delimiter", { fg = fg, italic = true })
vim.api.nvim_set_hl(0, "Special", { fg = fg })
vim.api.nvim_set_hl(0, "@variable", { fg = lightwhite })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = fg, italic = true })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = lightwhite, italic = true })
vim.api.nvim_set_hl(0, "@constructor", { fg = fg })
vim.api.nvim_set_hl(0, "statusLine", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "statusLineNC", { fg = fg, bg = statusline })
--IncSearch

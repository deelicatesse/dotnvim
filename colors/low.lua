-- RESET TO LOAD THEME
vim.cmd("hi clear")
if vim.fn.exists("syntax on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "lowquiet" -- SET NAME

-- PALETTE COLORS
local fg          = "#000000"
local bg          = "#d7d7d7"
local dim         = "#3B3B3B"
local border      = "#5F5F5F"
local code        = "#1E1E1E"
local codebg      = "#EFEFEF"
local comment     = "#797979" ---"#4F4F4F"
local secondary   = "#292929"
local linenr      = "#9B9B9B"
local statusline  = "#c7c7c7"

-- BUSCAR TRES TONOS DE NEGRO PARA VARS, DELIMITERS, FUNCTION
-- HIGHLIGHTS
local set         = vim.api.nvim_set_hl
-- BACKGROUND
set(0, "Normal", { fg = fg, bg = bg }) -- WITHOUT HIGHLIGHTS

-- COMMENTS
set(0, "Comment", { fg = comment, italic = true })

-- LINES AND NUMBERS
set(0, "LineNr", { fg = linenr })     -- column numbers
set(0, "CursorLineNr", { fg = fg })   -- cursor
set(0, "CursorLine", { bg = codebg }) --

-- BORDERS
set(0, "FloatBorder", { fg = border, bg = bg }) --window help, floatwindows
set(0, "WinSeparator", { fg = border })
set(0, "NormalFloat", { fg = fg, bg = linenr })

-- CODE
set(0, "Visual", { bg = linenr })             -- MODO VISUAL AL SELECCIONAR UN BLOQUE
set(0, "CodeBlock", { fg = fg, bg = linenr }) -- BG CODE-BLOCK MARKDOWN
set(0, "String", { fg = fg, italic = true })  -- VARIABLES DEFINIDAS `nums= []`
set(0, "Identifier", { fg = fg })             -- VARIABLES DEFINIDAS `nums= []`
set(0, "Keyword", { fg = fg })                -- PALABRAS RESERVADAS `IF, ELSE, WHILE etc...`
set(0, "Function", { fg = fg })               -- FUNCIONES DEFINIDAS `def init()` `init()` tendra el style

-- PLEGADO
set(0, "Folted", { fg = dim, bg = "#F1F1F1" }) -- CONTROLA TEXTO Y BG DE LINEA PLEGADAS

-- HELPERS
vim.api.nvim_set_hl(0, "Delimiter", { fg = fg, italic = true })            -- ,, ;, {, }
vim.api.nvim_set_hl(0, "Special", { fg = fg, italic = true })              -- @, #, %, \n, \t
vim.api.nvim_set_hl(0, "@keyword.function", { fg = fg, italic = true })    -- def fuction etc...
vim.api.nvim_set_hl(0, "@variable", { fg = secondary })                    -- variables
vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = fg, italic = true }) -- resalta [], {}
vim.api.nvim_set_hl(0, "@constructor", { fg = fg })                        -- llamas a constructores `def __init__()`
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })

vim.api.nvim_set_hl(0, "@markup.heading", { fg = comment, bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = comment, bold = true })
vim.api.nvim_set_hl(0, "statusLine", { fg = dim, bg = statusline }) --active
--vim.api.nvim_set_hl(0, "statusLineNC", { fg = fg, bg = comment }) --inactive
--vim.api.nvim_set_hl(0, "statusLineTerm", { fg = dim, bg = "#E0E0E0" })
--vim.api.nvim_set_hl(0, "statusLineTermNC", { fg = dim, bg = "#E0E0E0" })

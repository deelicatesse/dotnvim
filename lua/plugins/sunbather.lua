return {
  'nikolvs/vim-sunbather',
  config = function ()
    vim.opt.termguicolors= true,
    vim.cmd([[colorscheme sunbather]])
  end,

}

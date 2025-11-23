return {
   'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    config = function()
	require('render-markdown').setup({})
    end,
    dependencies = {'nvim-tree/nvim-web-devicons'}
}

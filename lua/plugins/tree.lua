return {
  {
   'nvim-tree/nvim-tree.lua',
    version = '*',
    config = function()
      require('nvim-tree').setup()
   end,
  },
   {'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup()
    end,
  },
}

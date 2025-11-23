return {
  "mistweaverco/kulala.nvim",
  ft = {"http", "rest"},
  config = function ()
    require("kulala").setup({
      env_file = ".env",
      ui = {
        display_mode = "split",
        split_direction = "vertical",
        default_view = "body",
      },
    })
  end,
}

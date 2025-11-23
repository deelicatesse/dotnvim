return {
  {
    "jim-at-jibba/micropython.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      -- Variables globales para configuración
      vim.g.micropython_port = "/dev/ttyUSB0"   -- cambia según tu puerto
      vim.g.micropython_baud = 115200
      vim.g.micropython_use_toggleterm = true
      -- Configurar el venv
      local venv_path = "/home/delawerr/iot/first_steps"
      vim.env.VIRTUAL_ENV = venv_path
      vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH

      -- Mapea la tecla para ejecutar el archivo actual
      vim.keymap.set("n", "<leader>mr", function()
        require("micropython_nvim").run()
      end, { desc = "Ejecutar script MicroPython" })
    end
  }
}


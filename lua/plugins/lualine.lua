return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {

        theme = "horizon",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    })
  end,
}

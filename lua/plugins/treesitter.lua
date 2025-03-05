return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "json",
        "prisma",
      },
    })
  end,
}

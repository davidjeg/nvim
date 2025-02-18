return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>mt",
      function()
        local conform = require("conform")
        conform.format({
          formatters = { "injected", timeout_ms = 1000 },
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "prettier_d" },
        css = { "prettier_d" },
        json = { "prettier_d" },
        javascript = { "prettier_d" },
        typescript = { "prettier_d" },
        javascriptreact = { "prettier_d" },
        typescriptreact = { "prettier_d" },
      },
    }

    return opts
  end,
}

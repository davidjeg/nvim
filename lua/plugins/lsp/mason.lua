return {
  "williamboman/mason.nvim", -- Plugin principal de mason.nvim
  build = ":MasonUpdate",
  cmd = "Mason",
  opts = {
    ensure_installed = {
      "pyright", -- Python LSP
      "vtsls", -- TS JS LSP
      "prettier", -- Formatter
      "tailwindcss-language-server", -- Tailwind LSP
      "lua-language-server", -- Lua LSP
      "eslint_d", -- Linter
      "css-lsp", -- CSS LESS SCSS
    },
  },
  config = function(_, opts)
    -- Configurar Mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓", -- Icono para paquetes instalados
          package_pending = "➜", -- Icono para paquetes pendientes
          package_uninstalled = "✗", -- Icono para paquetes desinstalados
        },
      },
    })

    -- Asegurarse de que los paquetes de `ensure_installed` estén instalados
    local mason_registry = require("mason-registry")
    mason_registry.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mason_registry.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)
  end,
}

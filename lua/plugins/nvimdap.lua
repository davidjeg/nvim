return {

  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
  },

  event = "VeryLazy",

  config = function()
    local nvim_virtual_text = require("nvim-dap-virtual-text")
    local dap = require("dap")

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          "C:/Users/David/OneDrive/Desktop/vscode-js-debug-1.97.1/src/dapDebugServer.ts",
          "--port",
          "${port}",
        },
      },
    }
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "attach",
        reAttach = "true",
        name = "Launch Program",
        program = "${file}", -- Esto lanzará el archivo JavaScript abierto
        cwd = "${workspaceFolder}", -- Establece el directorio de trabajo como el directorio actual
      },
    }

    nvim_virtual_text.setup({
      highlight_changed_variables = true,
      virt_text_pos = "inline",
      display_callback = function(variable, buf, stackframe, node, options)
        -- by default, strip out new line characters
        if options.virt_text_pos == "inline" then
          return " = " .. variable.value:gsub("%s+", " ")
        else
          return variable.name .. " = " .. variable.value:gsub("%s+", " ")
        end
      end,
    })
  end,
}

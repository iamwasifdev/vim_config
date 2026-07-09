local function setup_js_debug()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end

  local dap_vscode = require("dap.ext.vscode")

  -- adapters for js-debug-adapter (pwa-node, pwa-chrome, pwa-msedge)
  for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
    local pwaType = "pwa-" .. adapterType
    if not dap.adapters[pwaType] then
      dap.adapters[pwaType] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = { command = "js-debug-adapter", args = { "${port}" } },
      }
    end
    if not dap.adapters[adapterType] then
      dap.adapters[adapterType] = function(cb, _config)
        cb(dap.adapters[pwaType])
      end
    end
  end

  -- configurations for TS/JS
  local filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  local configs = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch with tsx",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "npx",
      runtimeArgs = { "tsx" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch dev server (npm run dev)",
      runtimeExecutable = "npm",
      runtimeArgs = { "run", "dev" },
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Next.js dev",
      runtimeExecutable = "npx",
      runtimeArgs = { "next", "dev" },
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to Chrome",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
  for _, ft in ipairs(filetypes) do
    dap.configurations[ft] = vim.list_extend(dap.configurations[ft] or {}, configs)
  end

  -- map pwa adapter types to filetypes (for launch.json support)
  for _, t in ipairs({ "pwa-node", "pwa-chrome", "pwa-msedge" }) do
    dap_vscode.type_to_filetypes[t] = filetypes
  end
end

-- run once when dap is first loaded, after LazyVim's config has completed
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  once = true,
  callback = function()
    vim.schedule(setup_js_debug)
  end,
})

return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      -- also run when dap is loaded early (before VeryLazy fires)
      vim.schedule(setup_js_debug)
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "codelldb", "js-debug-adapter" })
    end,
  },
}

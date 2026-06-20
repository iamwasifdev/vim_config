return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        -- LSP servers
        "typescript-language-server",
        "clangd",
        "eslint-lsp",

        -- Formatters
        "prettier",
      },
      -- automatically install on startup if missing
      auto_update = false,
      run_on_start = true,
    },
  },
}

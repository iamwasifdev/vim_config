return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})

      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({})-- Enable built-in LSP completion (Neovim 0.10+)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.lsp.completion.enable(
            true,
            args.data.client_id,
            args.buf,
            { autotrigger = true }
          )
        end,
      })

      vim.keymap.set("n","<leader>ca",vim.lsp.buf.code_action,{})

    end,
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        update_in_insert = false,
        float = { border = "rounded", source = true },
      },
      servers = {
        ts_ls = {},
      },
    },
  },
}

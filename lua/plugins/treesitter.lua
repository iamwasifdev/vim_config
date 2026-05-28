return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function(_, opts)
    -- Use gcc compiler
    require('nvim-treesitter.install').compilers = { "gcc" }
    
    -- Add your languages here
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "lua",
      "javascript",
      "typescript",
      "python",
      "bash",
      "html",
      "css",
      "json",
      "markdown",
    })
  end,
}
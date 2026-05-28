return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        init_options = {
          fallbackFlags = {
            "--target=x86_64-w64-mingw32",
            "-ID:/gcc_compiler_5.2/x86_64-w64-mingw32/lib/gcc/x86_64-w64-mingw32/15.2.0/include",
            "-ID:/gcc_compiler_5.2/x86_64-w64-mingw32/lib/gcc/x86_64-w64-mingw32/15.2.0/include-fixed",
            "-ID:/gcc_compiler_5.2/x86_64-w64-mingw32/include",
            "-ID:/gcc_compiler_5.2/x86_64-w64-mingw32/x86_64-w64-mingw32/include",
          },
        },
      },
    },
  },
}

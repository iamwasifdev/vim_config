return {
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    keys = {
      { "ghd", "<cmd>Glance definitions<cr>", desc = "Peek Definition" },
      { "ght", "<cmd>Glance type_definitions<cr>", desc = "Peek Type Definition" },
      { "ghr", "<cmd>Glance references<cr>", desc = "Peek References" },
      { "ghi", "<cmd>Glance implementations<cr>", desc = "Peek Implementations" },
    },
    opts = {
      height = 18,
      preview_win_opts = {
        cursorline = true,
        number = true,
        wrap = false,
      },
      border = {
        enable = true,
        top_char = "―",
        bottom_char = "―",
      },
    },
  },
}

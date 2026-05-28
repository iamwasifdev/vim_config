return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0",
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged", "TextChangedI" },
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
      defer_save = { "InsertLeave", "TextChanged", "TextChangedI" },
      cancel_deferred_save = { "InsertEnter" },
    },
    condition = nil,
    write_all_buffers = false,
    noautocmd = true,
    lockmarks = false,
    debounce_delay = 135,
    debug = false,
  },
}

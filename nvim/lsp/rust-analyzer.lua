return {
  root_markers = { "Cargo.toml", "Cargo.lock" },
  filetypes = { "rust" },
  cmd = { "rust-analyzer" },
  capabilities = {

  },
  settings = {
    imports = {
        granularity = {
            group = "module",
        },
        prefix = "self",
    },
    cargo = {
        buildScripts = {
            enable = true,
        },
    },
    procMacro = {
        enable = true
    },
  }
}

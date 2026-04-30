return {
  root_markers = { "Package.resolved", "Package.swift" },
  filetypes = { "swift" },
  cmd = { "sourcekit-lsp" },
  --init_options = {
  --  backgroundIndexing = false
  --},
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true
      }
    }
  }
}

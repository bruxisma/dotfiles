return {
  root_markers = { "Package.resolved", "Package.swift" },
  filetypes = { "swift" },
  cmd = { "sourcekit-lsp" },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true
      }
    }
  }
}

return {
  filetypes = {"go", "gomod", "gosum" },
  cmd = {"gopls"},
  settings = {
    autoformat = true,
    gopls = {
      gofumpt = true,
    }
  }
}

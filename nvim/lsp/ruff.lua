return {
  root_markers = { "pyproject.toml" }
  filetypes = { "python" }
  cmd = { "poetry", "run", "ruff", "server" }
}

return {
  single_file_support = true,
  root_markers = { "compose.yml" },
  filetypes = { "yaml.docker-compose" },
  cmd = { "docker-compose-langserver", "--stdio" },
}

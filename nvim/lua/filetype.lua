local filetypes = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "css",
  "diff",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "html",
  "ini",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "ninja",
  "pkl",
  "powershell",
  "proto",
  "python",
  "query",
  "rust",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
  "xml",
  "yaml",
  "zig",
}

vim.filetype.add({
  extension = {
    hexpat = "hexpat",

    apinotes = "yaml",
    winget = "yaml",

    vitaltheme = "json",
    vitalskin = "json",

    tfbackend = "hcl",
    tfvars = "hcl",
    tofu = "hcl",
    tf = "hcl",

    targets = "xml",
    props = "xml",
    slnx = "xml",
    wsb = "xml",
    wxs = "xml",
    xmp = "xml",

    pkl = "pkl",
  },
  pattern = {
    [".+/%.local/share/ssh/.+%.conf"] = "sshconfig",
    [".+/%.config/ssh/.+%.conf"] = "sshconfig",
    [".+/git/config"] = "gitconfig",
  }
})

local configuration = { filetypes, { max_jobs = 4 } }
local install = require("nvim-treesitter").install
local ok, err = pcall(install, configuration)
return filetypes

local fn = vim.fn
local bootstrap = require("plugins.bootstrap")

require("packer").startup {
  require("plugins.manifest"),
  config = {
    compile_path = require("packer.util").join_paths(
      fn.stdpath "cache",
      "packer.nvim",
      "compiled.lua"
    ),
    display = {
      error_sym = "❌",
      done_sym = "✅",
      removed_sym = "➖",
      moved_sym = "➡",
    },
  },
}


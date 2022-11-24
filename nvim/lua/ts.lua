local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  highlight = {
    additional_vim_regex_highlighting = { "dockerfile", "cmake" },
    enable = true,
    disable = { "dockerfile" },
    incremental_selection = { enable = true },
    indent = { enable = true, disable = { "lua" } },
  },
}

require("tree-sitter-just").setup {}

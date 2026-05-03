require("prelude")
require("plugins")

require("filetype")

require("globals")
require("options")
require("keymaps")
require("ableton")
require("autocmd")
require("aliases")

vim.cmd.colorscheme("gruvbox")
vim.lsp.enable({ "sourcekit", "rust-analyzer" })
vim.diagnostic.config({ virtual_lines = { current_line = true } })

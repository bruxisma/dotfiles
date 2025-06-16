require("manager")
require("globals")
require("options")
require("keymaps")
require("autocmd")
require("lazy").setup("plugins")

vim.cmd.colorscheme("gruvbox")

vim.diagnostic.config({virtual_lines = { current_line = true }})
vim.lsp.enable({ "sourcekit" })

-- Lets us create custom lowercase user commands to overwrite builtins like 'ls' for actual useful features.
local function alias(name, ...)
  local args = { ... }
  vim.keymap.set("ca", name, function()
    if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline():find("^" .. name) then
      return table.concat(args, " ")
    end
    return name
  end, { noremap = true, expr = true, replace_keycodes = true })
end

alias("grc", "edit", "$MYGVIMRC")
alias("rc", "edit", "$MYVIMRC")

alias("unstage", "lua", "package.loaded.gitsigns.reset_hunk()")
alias("stage", "lua", "package.loaded.gitsigns.stage_hunk()")
alias("blame", "lua", "package.loaded.gitsigns.blame_line { full = true }")

alias("debug", "lua", "package.loaded.dapui.toggle()")

alias("rename", "lua", "vim.lsp.buf.rename()")
alias("act", "lua", "vim.lsp.buf.code_action()")
alias("fmt", "lua", "vim.lsp.buf.format()")

alias("files", "Telescope file_browser")
alias("ls", "Telescope buffers")

alias("chmod", "Chmod")
alias("rm", "Delete")

alias("todo", "TodoTrouble")
alias("json", "%!jq .")
alias("lgrep", "silent", "lgrep")
alias("grep", "silent", "grep")

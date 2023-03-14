vim.opt.runtimepath:append(vim.fn.stdpath("cache") .. "/packer.nvim")
require("plugins")

require("completions")
require("options")
require("keymaps")
require("autocmd")
require("lsp")
require("dbg")
require("ts")

vim.notify = require("notify")

require("gitmoji")

require("gruvbox").setup {
  invert_selection = true,
  contrast = "hard",
}
vim.cmd.colorscheme("gruvbox")

-- Leftover from orginal vimrc. Will remain until it can be *fully* replaced.
vim.cmd([[
function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction

cnoreabbrev <expr> grc <SID>command("grc", "edit<Space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<Space>$MYVIMRC")

cnoreabbrev <expr> unstage <SID>command("unstage", "GitGutterUndoHunk")
cnoreabbrev <expr> stage <SID>command("stage", "GitGutterStageHunk")

cnoreabbrev <expr> refresh <SID>command("refresh", "filetype<Space>detect")

cnoreabbrev <expr> reload <SID>command("reload", "source<Space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

"cnoreabbrev <expr> find <SID>command("find", "Files<Space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Telescope<Space>buffers")

cnoreabbrev <expr> todo <SID>command("todo", "TodoTrouble")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

cnoreabbrev <expr> st <SID>command("st", "GFiles?")

cnoreabbrev <expr> fmt <SID>command("fmt", "lua vim.lsp.buf.format()")
cnoreabbrev <expr> fix <SID>command("fix", "lua vim.lsp.buf.code_action()")
]])

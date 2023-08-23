require("manager")
require("globals")
require("options")
require("keymaps")
require("autocmd")
require("lazy").setup("plugins", {
  ui = {
    icons = {
      start = "🚀",
      source = "📄",
      plugin = "📦",
      config = "⚙",
    },
  },
})

require("gitmoji")
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

cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Telescope<Space>buffers")

cnoreabbrev <expr> todo <SID>command("todo", "TodoTrouble")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

cnoreabbrev <expr> fmt <SID>command("fmt", "lua vim.lsp.buf.format()")
cnoreabbrev <expr> fix <SID>command("fix", "lua vim.lsp.buf.code_action()")
]])

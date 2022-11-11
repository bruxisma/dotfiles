require "settings"

vim.opt.mouse = "a"
vim.opt.guifont = "Delugia:h10"

vim.api.nvim_set_keymap("i", "<Tab>", [[copilot#Accept("\<Tab>")]], {
  silent = true,
  script = true,
  expr = true,
})

vim.cmd [[colorscheme gruvbox]]

vim.g.is_kornshell = 0
vim.g.is_posix = 1
vim.g.sh_fold_enabled = 3

-- Leftover from orginal vimrc. Will remain until it can be replaced.
vim.cmd [[
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

cnoreabbrev <expr> find <SID>command("find", "Files<Space>$HOME/Desktop")
cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Telescope<Space>buffers")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

cnoreabbrev <expr> st <SID>command("st", "GFiles?")
]]
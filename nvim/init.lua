require("manager")
require("globals")
require("options")
require("keymaps")
require("autocmd")
require("lazy").setup("plugins")

vim.cmd.colorscheme("gruvbox")

-- Leftover from orginal vimrc. Will remain in *some* until it can be *fully* replaced.
-- NOTE: This is coming soonish, as nvim_set_keymap now supports command abbreviations
-- This function is placed here to be used as the callback for the eventual keymap sets
local function command(name, ...)
  if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline():find("^" .. name) then
    return table.concat(..., " ")
  end
  return name
end

vim.cmd([[
function! s:command(name, ...)
  return getcmdtype() == ':' && getcmdline() =~# '^' .. a:name
        \ ? join(a:000, ' ')
        \ : a:name
endfunction

cnoreabbrev <expr> grc <SID>command("grc", "edit<Space>$MYGVIMRC")
cnoreabbrev <expr> rc <SID>command("rc", "edit<Space>$MYVIMRC")

cnoreabbrev <expr> unstage <SID>command("unstage", "lua package.loaded.gitsigns.reset_hunk()")
cnoreabbrev <expr> stage <SID>command("stage", "lua package.loaded.gitsigns.stage_hunk()")
cnoreabbrev <expr> fmt <SID>command("fmt", "lua vim.lsp.buf.format()")
cnoreabbrev <expr> fix <SID>command("fix", "lua vim.lsp.buf.code_action()")
cnoreabbrev <expr> rename <SID>command("rename", "lua vim.lsp.buf.rename()")
cnoreabbrev <expr> files <SID>command("files", "Telescope file_browser")

cnoreabbrev <expr> reload <SID>command("reload", "source<Space>$MYVIMRC")
cnoreabbrev <expr> chmod <SID>command("chmod", "Chmod")

cnoreabbrev <expr> rm <SID>command("rm", "Delete")
cnoreabbrev <expr> ls <SID>command("ls", "Telescope<Space>buffers")

cnoreabbrev <expr> todo <SID>command("todo", "TodoTrouble")

cnoreabbrev <expr> json <SID>command("json", "%!jq<Space>.")

cnoreabbrev <expr> lgrep <SID>command("lgrep", "silent<Space>lgrep")
cnoreabbrev <expr> grep <SID>command("grep", "silent<Space>grep")

]])

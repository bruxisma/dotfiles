local window, option, fn = vim.w, vim.opt, vim.fn

window.termencoding = "utf-8"
window.foldlevelstart = 10
window.foldnextmax = 10
window.foldenable = true

option.colorcolumn = "80"
option.virtualedit = "block"

option.shiftwidth = 2
option.softtabstop = 1
option.tabstop = 2

option.fileformats = { "unix", "dos" }
option.laststatus = 2
option.shortmess:append "aoOTIF"

option.modeline = false
option.swapfile = false
option.visualbell = true
option.number = true

option.showmatch = true
option.matchtime = 1

option.ignorecase = true
option.smartcase = true
option.expandtab = true
option.autochdir = true

option.list = true

if vim.fn.has "+diff" then
  option.diffopt:append "vertical"
end

if vim.fn.executable "rg" then
  option.grepformat:prepend "%f:%l%c:%m"
  option.grepprg = [[rg --vimgrep --no-heading --smart-case]]
end

vim.cmd [[let mapleader = ","]]
-- For some reason this doesn't work if written in raw lua
vim.cmd [[set listchars=tab:»\ ,extends:▶,precedes:◀,nbsp:␣,trail:·]]

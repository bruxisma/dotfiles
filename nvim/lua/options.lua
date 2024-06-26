local window, option, fn = vim.w, vim.opt, vim.fn

window.termencoding = "utf-8"

option.foldlevelstart = 10
option.foldenable = false
option.foldmethod = "expr"
option.foldexpr = "v:lua.vim.treesitter.foldexpr()"

option.colorcolumn = "80"
option.virtualedit = "block"

option.shiftwidth = 2
option.softtabstop = 1
option.tabstop = 2

option.fileformats = { "unix", "dos" }
option.laststatus = 2
option.shortmess = "aoOTIF"

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
option.listchars = {
  precedes = "◀",
  extends = "▶",
  nbsp = "␣",
  trail = "·",
  tab = "» ",
}

option.guifont = "Cascadia Code NF:h12"
option.mouse = "a"

if fn.has("+diff") then
  option.diffopt:append("vertical")
end

if fn.executable("rg") then
  option.grepprg = [[rg --vimgrep --smart-case --unrestricted --unrestricted]]
end

if fn.executable("pwsh") then
  option.shell = "pwsh"
  option.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  option.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit ${LastExitCode}"
  option.shellpipe = "2>&1 | Tee-Object -Encoding UTF8 %s; exit ${LastExitCode}"
  option.shellquote = ""
  option.shellxquote = ""
end

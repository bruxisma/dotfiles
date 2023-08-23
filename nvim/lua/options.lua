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

option.termguicolors = true
option.guifont = "Delugia:h10"
option.mouse = "a"

if fn.has("+diff") then
  option.diffopt:append("vertical")
end

if fn.executable("rg") then
  option.grepformat:prepend("%f:%l%c:%m")
  option.grepprg = [[rg --vimgrep --no-heading --smart-case]]
end

if fn.executable("pwsh") then
  -- TODO: Fill this out correctly for pwsh $SHELL usage
end

-- TODO: Replace with lualine or similar 🤔
vim.cmd([[
  let g:lightline =<< trim STATUS
    #{
        colorscheme: 'gruvbox',
        active: #{
          left: [
            ['mode', 'paste'],
            ['readonly', 'filename', 'modified']
          ]
        },
        component : #{ lineinfo: "\ue0a1 %3l:%-2v" },
        component_function : #{
          readonly: 'LightlineReadonly',
        },
        separator: #{ left: "\ue0b0", right: "\ue0b2" },
        subseparator: #{ left: "\ue0b1", right: "\ue0b3" }
     }
  STATUS
  let g:lightline = eval(join(g:lightline))
]])

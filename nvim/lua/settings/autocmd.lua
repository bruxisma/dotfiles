vim.cmd([[autocmd QuickFixCmdPost [^l]* nested cwindow]])
vim.cmd([[autocmd QuickFixCmdPost    l* nested lwindow]])

vim.cmd([[
  autocmd BufNewFile,BufRead *.local/share/ssh/*.conf,*/.config/ssh/*.conf setfiletype sshconfig
]])

--[[
TODO: Move to this kind of call when possible.
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*/.config/ssh/*.conf"},
  command = "setfiletype sshconfig"
})
]]

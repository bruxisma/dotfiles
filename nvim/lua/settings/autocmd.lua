vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {
    vim.fn.expand("~") .. "/.local/share/ssh/*.conf",
    vim.fn.expand("~") .. "/.config/ssh/*.conf"
  },
  command = "setfiletype sshconfig"
})

-- I'm unsure if I need these anymore
vim.api.nvim_create_autocmd({"QuickFixCmdPost"}, {
  desc = "Automatically open quickfix on :make",
  command = "cwindow",
  pattern = "[^l]*",
  nested = true,
})

vim.api.nvim_create_autocmd({"QuickFixCmdPost"}, {
  desc = "Automatically open quickfix on :make",
  command = "lwindow",
  pattern = "l*",
  nested = true,
})

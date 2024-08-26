local function filetype(filetype, pattern)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = pattern,
    command = string.format("setfiletype %s", filetype)
  })
end

filetype("sshconfig", { "*/.local/share/ssh/*.conf", "*/.config/ssh/*.conf" })
filetype("hcl", { "*.tf", "*.tofu" })
filetype("xml", { "*.wxs" })
filetype("help", {
  vim.fs.normalize(vim.fs.joinpath(vim.env.VIMRUNTIME, "doc", "*.txt")),
  vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "*", "doc", "*.txt")),
})

-- I'm unsure if I need these anymore
vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  desc = "Automatically open quickfix on :make",
  command = "cwindow",
  pattern = "[^l]*",
  nested = true,
})

vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
  desc = "Automatically open quickfix on :make",
  command = "lwindow",
  pattern = "l*",
  nested = true,
})

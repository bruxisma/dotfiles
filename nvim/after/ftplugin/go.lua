local golang = vim.api.nvim_create_augroup("goformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  group = golang,
  callback = function() require("go.format").goimport() end
})

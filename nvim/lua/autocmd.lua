function filetype(filetype, pattern)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = pattern,
    command = string.format("setfiletype %s", filetype)
  })
end

filetype("sshconfig", { "*/.local/share/ssh/*.conf", "*/.config/ssh/*.conf" })
filetype("yaml", { "*.winget" })
filetype("xml", { "*.wxs", "*.wsb", "*.props", "*.targets" })
filetype("hcl", { "*.tf", "*.tofu" })
filetype("help", {
  vim.fs.normalize(vim.fs.joinpath(vim.env.VIMRUNTIME, "doc", "*.txt")),
  vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "*", "doc", "*.txt")),
})

vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically resize the window splits when resizing the window",
  command = "wincmd =",
  pattern = "*",
})

-- I'm unsure if I need these anymore
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  desc = "Automatically open quickfix on :make",
  command = "cwindow",
  pattern = "[^l]*",
  nested = true,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  desc = "Automatically open quickfix on :make",
  command = "lwindow",
  pattern = "l*",
  nested = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buffer)
    end
  end,
})

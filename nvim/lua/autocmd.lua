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

-- Default LSP Settings
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buffer)
    end
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
        end
      })
    end
  end,
})

-- read ableton files
vim.api.nvim_create_augroup("ableton", { clear = true })
vim.api.nvim_create_autocmd({"BufReadPre", "FileReadPre"}, {
  group = "ableton",
  pattern = { "*.adv", "*.adg" },
  command = "setlocal bin",
})

-- Create a directory if the path doesn't exist
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end
})

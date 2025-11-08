local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("ableton", { clear = true })

autocmd("VimResized", {
  desc = "Automatically resize the window splits when resizing the window",
  command = "wincmd =",
  pattern = "*",
})

autocmd("QuickFixCmdPost", {
  desc = "Automatically open quickfix on :make",
  command = "cwindow",
  pattern = "[^l]*",
  nested = true,
})

autocmd("QuickFixCmdPost", {
  desc = "Automatically open quickfix on :make",
  command = "lwindow",
  pattern = "l*",
  nested = true,
})

autocmd("LspAttach", {
  desc = "LSP Formatting",
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buffer)
    end
    if client:supports_method("textDocument/formatting") then
      autocmd("BufWritePre", {
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
        end
      })
    end
  end,
})

autocmd("BufWritePre", {
  desc = "Create a directory when saving a file if the path doesn't exist",
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end
})

autocmd("FileType", {
  pattern = require("treesitter")[1],
  callback = function()
    vim.treesitter.start()
  end,
})

--autocmd({"BufReadPre", "FileReadPre"}, {
--  desc = "Attempt to read ableton files in-situ",
--  group = "ableton",
--  pattern = { "*.adv", "*.adg" },
--  command = "setlocal bin",
--})

--autocmd({"BufRead"}, {
--  desc = "Attempt to read ableton files in-situ",
--  group = "ableton",
--  pattern = { "*.adv", "*.adg", "*.als" },
--  command = "call gzip#read(\"gzip -dn\")"
--})

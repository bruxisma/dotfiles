vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", {
  desc = "Cancel insert mode",
  noremap = true,
})

vim.keymap.set("n", "<Leader>vs", ":vsplit<CR><C-W>l", {
  desc = "Open a new vertical split and switch to it",
  noremap = true,
})

vim.keymap.set("n", "<Leader>hs", ":split<CR><C-W>j", {
  desc = "Open a new horizontal split and switch to it",
  noremap = true,
})

vim.keymap.set("n", "<Leader>v", vim.cmd.vsplit, {
  desc = "Open a new vertical split",
  noremap = true,
})

vim.keymap.set("n", "<Leader>h", vim.cmd.split, {
  desc = "Open a new horizontal split",
  noremap = true,
})

vim.keymap.set("n", "[f", vim.cmd.lnext, {
  desc = "Go to previous location list item",
  noremap = true,
})

vim.keymap.set("n", "]f", vim.cmd.lnext, {
  desc = "Go to next location list item",
  noremap = true,
})

vim.keymap.set("n", "<Leader><Space>", function()
  vim.fn.setreg("/", "")
end, {
  desc = "Clear 'hlsearch'",
  silent = true,
  noremap = true,
})

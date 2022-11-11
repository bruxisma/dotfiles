local function command(cmd)
  return string.format(":%s<CR>", cmd)
end

vim.keymap.set("n", "<Leader>vs", ":vsplit<CR><C-W>l", {
  desc = "Open a new vertical split and switch to it",
  noremap = true,
})

vim.keymap.set("n", "<Leader>hs", ":split<CR><C-W>j", {
  desc = "Open a new horizontal split and switch to it",
  noremap = true,
})

vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", {
  desc = "Open a new vertical split",
  noremap = true,
})

vim.keymap.set("n", "<Leader>h", ":split<CR>", {
  desc = "Open a new horizontal split",
  noremap = true,
})

vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", {
  desc = "Cancel insert mode",
  noremap = true,
})

vim.keymap.set("n", "[f", ":lprevious<CR>", {
  desc = "Go to previous location list item",
  noremap = true,
})

vim.keymap.set("n", "]f", ":lnext<CR>", {
  desc = "Go to next location list item",
  noremap = true,
})

vim.keymap.set("n", "<Leader><Space>", [[:call setreg('/', '')<CR>]], {
  desc = "Clear 'hlsearch'",
  silent = true,
  noremap = true,
})

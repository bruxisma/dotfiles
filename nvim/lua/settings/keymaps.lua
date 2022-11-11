local function command(cmd)
  return string.format(":%s<CR>", cmd)
end

vim.api.nvim_set_keymap("n", "<Leader>vs", command "vsplit", {
  noremap = true, --[[desc = "Open a new vertical split"]]
})
vim.api.nvim_set_keymap("n", "<Leader>h", command "split", {
  noremap = true, --[[desc = "Open a new horizontal split"]]
})

--vim.api.nvim_set_keymap("n", "<Leader>vs", command "<C-W>v<C-W>l", {
--  noremap = true, --[[desc = "Open a new vertical split and switch to it"]]
--})
--
--vim.api.nvim_set_keymap("n", "<Leader>hs", command "<C-W>h<C-W>j", {
--  noremap = true, --[[desc = "Open a new horizontal split and switch to it"]]
--})

for _, mode in ipairs { "i", "v" } do
  vim.api.nvim_set_keymap(mode, "<C-C>", "<Esc>", {
    noremap = true, --[[desc = "Cancel insert mode"]]
  })
end

vim.api.nvim_set_keymap("n", "[f", command "lprevious", {
  noremap = true, --[[desc = "Go to previous location list item"]]
})
vim.api.nvim_set_keymap("n", "]f", command "lnext", {
  noremap = true, --[[desc = "Go to next location list item"]]
})

vim.api.nvim_set_keymap("n", "<Leader><Space>", command "call setreg('/', '')", {
  silent = true,
  noremap = true, --[[desc = "Clear 'hlsearch'"]]
})

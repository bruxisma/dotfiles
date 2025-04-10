local insert = "i"
local normal = "n"
local visual = "v"

local function popup(popupKey, insertKey)
  return function()
    return vim.fn.pumvisible() ~= 0 and popupKey or insertKey
  end
end

local function snippet(filter)
  return function()
    vim.snippet.active(filter)
  end
end

vim.keymap.set({ insert, visual }, "<C-c>", "<Esc>", {
  desc = "Cancel insert mode",
  noremap = true,
})

vim.keymap.set(normal, "<Leader>vs", ":vsplit<CR><C-W>l", {
  desc = "Open a new vertical split and switch to it",
  noremap = true,
})

vim.keymap.set(normal, "<Leader>hs", ":split<CR><C-W>j", {
  desc = "Open a new horizontal split and switch to it",
  noremap = true,
})

vim.keymap.set(normal, "<Leader>v", vim.cmd.vsplit, {
  desc = "Open a new vertical split",
  noremap = true,
})

vim.keymap.set(normal, "<Leader>h", vim.cmd.split, {
  desc = "Open a new horizontal split",
  noremap = true,
})

vim.keymap.set(normal, "<Leader><Space>", function() vim.fn.setreg("/", "") end, {
  desc = "Clear 'hlsearch'",
  silent = true,
  noremap = true,
})

vim.keymap.set(insert, "<Down>", popup("<C-n>", "<Down>"), {
  desc = "Use down arrow to choose pop-up menu items",
  expr = true,
})

vim.keymap.set(insert, "<Up>", popup("<C-p>", "<Up>"), {
  desc = "Use up arrow to choose pop-up menu items",
  expr = true,
})

vim.keymap.set(insert, "<CR>", popup("<C-y>", "<CR>"), {
  desc = "Use Enter to select pop-up menu item",
  expr = true
})

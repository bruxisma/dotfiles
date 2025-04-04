-- Acts as a small bootstrap for lazy.nvim. By sequestering this away here,
-- I can move to something else in the future if necessary.
local lazypath = vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath("data"), "/lazy/lazy.nvim"))
if vim.tbl_isempty(vim.fs.find(".git", { path = lazypath, type = "directory" })) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

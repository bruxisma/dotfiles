-- Acts as a small bootstrap for lazy.nvim. By sequestering this away here,
-- I can move to something else in the future if necessary.
local lazypath = vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath("data"), "/lazy/lazy.nvim"))
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local output = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim",
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { output, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
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

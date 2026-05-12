local function import(module)
  local loaded = vim.tbl_get(package.loaded, module)
  if loaded then return loaded end
  local success, result = pcall(require, module)
  if not success then
    vim.notify("Failed to import module '" .. module .. "'. Received error: " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

local function setup(plugin)
  local configuration = vim.tbl_get(plugin.spec, "data", "configuration") or {}
  local name = vim.tbl_get(plugin.spec, "data", "module") or plugin.spec.name

  local skipsetup = vim.tbl_get(plugin.spec, "data", "skipsetup")
  if skipsetup then return end

  local module = import(name)
  if not module then return end

  local ok, err = pcall(module.setup, configuration)
  if not ok then
    vim.notify("Failed to setup module '" .. name .. "'. Received error: " .. err, vim.log.levels.ERROR)
    return
  end
end

local function packages()
  return vim.iter(vim.pack.get())
end

local function preloaded(plugin)
  return plugin.active and vim.tbl_get(plugin.spec, "data", "prelude")
end

local function normative(plugin)
  return not preloaded(plugin)
end

-- Lets us create custom lowercase user commands to overwrite builtins like
-- 'ls' for actual useful features.
local function alias(name, ...)
  local args = { ... }
  local options = { noremap = true, expr = true, replace_keycodes = true }
  local mapping = function()
    if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline():find("^" .. name) then
      return table.concat(args, " ")
    end
    return name
  end
  vim.keymap.set("ca", name, mapping, options)
  package.loaded.prelude.aliases = vim.list.unique(vim.list_extend(package.loaded.prelude.aliases, { name }))
end

vim.pack.add({
  {
    name = "gruvbox",
    src = "https://github.com/ellisonleao/gruvbox.nvim",
    data = {
      configuration = {
        contrast = "hard",
        invert_selection = true
      },
      prelude = true,
    },
  },
  {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    name = "devicons",
    version = "nerd-v3.2-compat",
    data = {
      module = "nvim-web-devicons",
      prelude = true,
    }
  },
  {
    -- TODO: Remove dependency
    name = "plenary",
    src = "https://github.com/nvim-lua/plenary.nvim",
    data = {
      skipsetup = true,
      prelude = true
    },
  },
  {
    name = "notify",
    src = "https://github.com/rcarriga/nvim-notify",
    data = { prelude = true },
  },
})

packages():filter(preloaded):map(setup):totable()

--vim.notify = package.loaded.notify
require('vim._core.ui2').enable()


return {
  alias = alias,
  aliases = {},
  import = import,
  normative = normative,
  packages = packages,
  preloaded = preloaded,
  setup = setup,
}

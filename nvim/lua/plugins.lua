-- This is just the plugin specifications, with a few helper functions
-- Complex configurations are stored in files that we call `require` on.
local function load(name)
  local ok, module = pcall(require, name)
  if not ok or type(module) ~= "table" then
    return {}
  end
  return module
end

local machine = load("machine")

-- TODO: move to blink.cmp for speed purposes
local plugins = {
  -- completions
  {
    "hrsh7th/nvim-cmp",
    config = require("completions"),
    opts = {},
    dependencies = {
      { "dcampos/cmp-snippy", dependencies = { "nvim-snippy" } },
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp",
      { "onsails/lspkind.nvim", lazy = true },
    },
  }
}

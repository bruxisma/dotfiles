vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

vim.pack.add({
  -- core plugins
  { src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "devicons" },
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" }, -- TODO: Remove dependency
  { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns", version = "v2.1.0" },
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
  { src = "https://github.com/rcarriga/nvim-notify", name = "notify" },

  -- Nice to haves
  -- TODO: Find a replacement, this is now archived
  { src = "https://github.com/stevearc/dressing.nvim", name = "dressing" },
  { src = "https://github.com/tpope/vim-eunuch", name = "eunuch" }, -- cmd:Mkdir, cmd:Rename, cmd:Delete
  { src = "https://github.com/folke/trouble.nvim", name = "trouble" }, -- cmd:Trouble, cmd:TroubleToggle
  { src = "https://github.com/folke/todo-comments.nvim", name = "todo-comments" },
  { src = "https://github.com/shortcuts/no-neck-pain.nvim", name = "no-neck-pain" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },
  { src = "https://github.com/saghen/blink.cmp", name = "blink", version = vim.version.range("^1") },

  -- haven't used this in some time... do I need it?
  { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
  -- now archived... here still because of dependencies
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter", version = "main" },

  -- lsp
  { src = "https://github.com/chrisgrieser/nvim-lsp-endhints", name = "lsp-endhints" },

  -- Filetype
  { src = "https://github.com/bruxisma/gitmoji.vim", name = "gitmoji" }, -- ft:gitcommit
  { src = "https://github.com/MeanderingProgrammer/markdown.nvim", name = "render-markdown" }, -- ft:markdown
  { src = "https://github.com/sfztools/sfz.vim", name = "sfz" } --ft:sfz
})

require("gruvbox").setup({ contrast = "hard", invert_selection = true })
vim.cmd.colorscheme("gruvbox")
vim.notify = require("notify")

-- TODO: Move to old `plugins` file
local function modified()
  if vim.bo.modified then
    return ""
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ""
  end
  return ""
end

local configurations = {
  lualine =  {
    -- TODO: Look into moving to this style 🙂‍↕️
    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
    theme = "gruvbox",
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
        { "filename", file_status = false },
        { modified },
      },
      lualine_c = {},
    },
  },
  gitsigns = {
    signs = {
      changedelete = { text = "" },
      delete = { text = "" },
      change = { text = "" },
      add = { text = "" },
    },
  },
  mason = {
    ui = {
      icons = {
        package_uninstalled = "○",
        package_installed = "●"
      }
    },
  },
  telescope = {
    extensions = {
      file_browser = { hijack_netrw = true },
    },
    pickers = {
      buffers = {
        mappings = {
          i = { ["<C-d>"] = "delete_buffer" },
          n = { ["d"] = "delete_buffer" },
        },
      },
    },
  },
  ["nvim-treesitter"] = {},
  ["render-markdown"] = {},
  ["todo-comments"] = {},
  dressing = {},
  ["lsp-endhints"] = {},
}

vim.iter(configurations):map(function(plugin, configuration)
  local status, err = pcall(require(plugin).setup, configuration)
  if not status then
    error("Failed to setup '" .. plugin .. "' received error: " .. err)
  end
end)

pcall(require("nvim-treesitter").install, unpack(require("treesitter")))

require("globals")
require("options")
require("keymaps")
require("ableton")
require("autocmd")

vim.diagnostic.config({ virtual_lines = { current_line = true } })
vim.lsp.enable({ "sourcekit" })

-- Lets us create custom lowercase user commands to overwrite builtins like 'ls' for actual useful features.
local function alias(name, ...)
  local args = { ... }
  vim.keymap.set("ca", name, function()
    if vim.fn.getcmdtype() == ':' and vim.fn.getcmdline():find("^" .. name) then
      return table.concat(args, " ")
    end
    return name
  end, { noremap = true, expr = true, replace_keycodes = true })
end

alias("grc", "edit", "$MYGVIMRC")
alias("rc", "edit", "$MYVIMRC")

alias("unstage", "lua", "package.loaded.gitsigns.reset_hunk()")
alias("stage", "lua", "package.loaded.gitsigns.stage_hunk()")
alias("blame", "lua", "package.loaded.gitsigns.blame_line { full = true }")

alias("debug", "lua", "package.loaded.dapui.toggle()")

alias("rename", "lua", "vim.lsp.buf.rename()")
alias("act", "lua", "vim.lsp.buf.code_action()")
alias("fmt", "lua", "vim.lsp.buf.format()")

alias("files", "Telescope file_browser")
alias("ls", "Telescope buffers")

alias("chmod", "Chmod")
alias("rm", "Delete")

alias("todo", "TodoTrouble")
alias("json", "%!jq .")
alias("lgrep", "silent", "lgrep")
alias("grep", "silent", "grep")

vim.filetype.add({
  extension = {
    hexpat = "hexpat",

    apinotes = "yaml",
    winget = "yaml",

    vitaltheme = "json",
    vitalskin = "json",

    tfbackend = "hcl",
    tfvars = "hcl",
    tofu = "hcl",
    tf = "hcl",

    targets = "xml",
    props = "xml",
    slnx = "xml",
    wsb = "xml",
    wxs = "xml",
    xmp = "xml",

    pkl = "pkl",
  },
  pattern = {
    [".+/%.local/share/ssh/.+%.conf"] = "sshconfig",
    [".+/%.config/ssh/.+%.conf"] = "sshconfig",
    [".+/git/config"] = "gitconfig",
  }
})

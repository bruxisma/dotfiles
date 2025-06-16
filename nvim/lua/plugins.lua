-- This is just the plugin specifications, with a few helper functions
-- Complex configurations are stored in files that we call `require` on.
local function modified()
  if vim.bo.modified then
    return ""
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ""
  end
  return ""
end

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
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    name = "gruvbox",
    opts = { contrast = "hard", invert_selection = true },
  },
  { "stevearc/dressing.nvim", opts = {} },
  { "bruxisma/gitmoji.vim", ft = { "gitcommit" } },
  { "shortcuts/no-neck-pain.nvim", cmd = "NoNeckPain" },
  {
    "rcarriga/nvim-notify",
    name = "notify",
    init = function(plugin)
      vim.notify = require(plugin.name)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        changedelete = { text = "" },
        delete = { text = "" },
        change = { text = "" },
        add = { text = "" },
      },
    },
  },
  -- Something more in this style would be nice.
  -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
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
    dependencies = { "nvim-web-devicons" },
  },
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = { icons = { package_uninstalled = "○", package_installed = "●" } },
    },
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {},
  },

  -- non-lua plugins
  --  TODO: evaluate using chrisgrieser/nvim-genghis as a replacement
  { "tpope/vim-eunuch", cmd = { "Mkdir", "Rename", "Delete" } },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("treesitter"),
    main = "nvim-treesitter.configs",
    init = function()
      local install = require("nvim-treesitter.install")
      install.compilers = { "clang" }
      install.prefer_git = false
    end,
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
      "nvim-treesitter/nvim-treesitter-refactor",
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = function(plugin)
          vim.fn.system { "cmake", "--preset", "ninja", "-S", plugin.dir }
          vim.fn.system { "cmake", "--build", plugin.dir .. "/build", "--target", "install" }
        end,
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
      telescope.load_extension("notify")
      telescope.load_extension("fzf")
    end,
    opts = {
      extensions = {
        file_browser = { hijack_netrw = true },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = "delete_buffer",
            },
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
      },
    },
  },

  -- diagnostics
  {
    "folke/trouble.nvim",
    tag = "stable",
    dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
    cmd = { "Trouble", "TroubleToggle" },
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- completions
  {
    "dcampos/nvim-snippy",
    opts = {
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
      },
    },
  },
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
  },
  -- LSP
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
  { "ray-x/go.nvim", ft = { "go" }, opts = { lsp_gofumpt = true } },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    config = true,
  },
}

return vim.list_extend(plugins, machine)

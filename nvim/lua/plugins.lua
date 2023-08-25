-- This is just the plugin specifications, with a few helper functions
-- Complex configurations are stored in files that we call `require` on.
local function modified()
  if vim.bo.modified then
    return ''
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ''
  end
  return ''
end

return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    opts = { contrast = "hard", invert_selection = true },
  },
  "bruxisma/gitmoji.vim", -- TODO: Rewrite in lua
  {
    "ojroques/nvim-osc52",
    name = "ssh-clipboard",
    config = require("clipboard"),
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-notify",
    name = "notify",
    init = function(plugin)
      vim.notify = require(plugin.name)
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
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
        lualine_b = { "branch", "diff", "diagnostics", { "filename", file_status = false }, { modified } },
        lualine_c = {},
      }
    },
    dependencies = { "nvim-web-devicons" },
  },

  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    config = require("lsp"),
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim" },
      "cmp-nvim-lsp",
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_uninstalled = "○",
          package_installed = "●",
        },
      },
    },
  },

  -- non-lua plugins
  "tpope/vim-eunuch", -- TODO: evaluate using chrisgrieser/nvim-genghis as a replacement
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("treesitter"),
    main = "nvim-treesitter.configs",
    init = function()
      require("nvim-treesitter.install").compilers = { "clang" }
    end,
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
      { "nvim-treesitter/playground",              cmd = "TSPlaygroundToggle" },
      "nvim-treesitter/nvim-treesitter-refactor",
      "IndianBoy42/tree-sitter-just",
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-github.nvim", --TODO: Set alias commaands
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
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
      telescope.load_extension("fzf")
      telescope.load_extension("dap")
      telescope.load_extension("gh")
    end,
    opts = {
      extensions = {
        file_browser = { hijack_netrw = true },
      },
    },
  },

  -- diagnostics
  {
    "folke/trouble.nvim",
    tag = "stable",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
    cmd = { "Trouble", "TroubleToggle" },
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {}
    end,
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
      { "dcampos/cmp-snippy",   dependencies = { "nvim-snippy" } },
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp",
      { "onsails/lspkind.nvim", lazy = true },
    },
  },
  -- LSP
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = { null_ls.builtins.formatting.stylua },
      }
    end,
  },
  --{ "simrat39/rust-tools.nvim" },
  { "folke/neodev.nvim",              opts = { lspconfig = false } },
  { "ray-x/go.nvim",                  opts = { lsp_gofumpt = true } },

  -- DAP
  { "rcarriga/nvim-dap-ui",           dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text" },

  -- { "p00f/clangd_extensions.nvim" }
  -- { folke/which-key.nvim }
}

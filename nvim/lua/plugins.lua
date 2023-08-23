-- This is just the plugin specifications, with a few helper functions
-- Complex configurations are stored in files that we call `require` on.

return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    opts = { contrast = "hard", invert_selection = true },
  },
  {
    "ojroques/nvim-osc52",
    name = "osc52",
    config = require("osc52"),
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
    "neovim/nvim-lspconfig",
    config = require("lsp"),
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim" },
      "cmp-nvim-lsp",
    },
  },
  -- Mason LSP Manager
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
  "tpope/vim-eunuch", -- TODO: check if this can be replaced with telescope-file-browser
  "bruxisma/gitmoji.vim", -- TODO: Rewrite in lua
  "airblade/vim-gitgutter", -- TODO: Replace with gitsigns.nvim
  -- TODO: Replace with some other statusline plugin, such as lualine
  { "shinchu/lightline-gruvbox.vim", dependencies = "itchyny/lightline.vim" },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("treesitter"),
    main = "nvim-treesitter.configs",
    build = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
      { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
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
    dependencies = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
    cmd = { "Trouble", "TroubleToggle" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- completions
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local snippy = require("snippy")
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            snippy.expand_snippet(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<CR>"] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "snippy" },
        },
      }
    end,
    opts = {},

    dependencies = {
      {
        "dcampos/cmp-snippy",
        dependencies = {
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
      },
      -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-cmdline" },
      -- { "hrsh7th/cmp-buffer" },
      -- { "hrsh7th/cmp-path" },
      -- { "lukas-reineke/cmp-under-comparator" },
      { "onsails/lspkind.nvim" },
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
  --{ "folke/neodev.nvim", dependencies = { "hrsh7th/nvim-cmp" } },
  { "ray-x/go.nvim", opts = { lsp_gofumpt = true } },

  -- DAP
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text" },

  -- to be evaluated
  -- { "windwp/nvim-autopairs" }
  -- { "hkupty/iron.nvim" }
  -- { "danymat/neogen" }
  -- { "ray-x/lsp_signature.nvim" }
  -- { "p00f/clangd_extensions.nvim" }
  -- { "nvim-lualine/lualine.nvim" }
}

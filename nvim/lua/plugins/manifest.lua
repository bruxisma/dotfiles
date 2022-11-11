local function telescope(use)
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-symbols.nvim", requires = { "nvim-telescope/telescope.nvim" } }
  use {
    "nvim-telescope/telescope-packer.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "wbthomas/packer.nvim",
    },
  }
  use {
    "nvim-telescope/telescope-github.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }
end

local function completion(use)
  use { "hrsh7th/nvim-cmp" }
  use { "dcampos/cmp-snippy", requires = "dcampos/nvim-snippy" }
end

local function languages(use)
  use { "simrat39/rust-tools.nvim", requires = "neovim/nvim-lspconfig" }
  use { "ray-x/go.nvim" }
  use { "IndianBoy42/tree-sitter-just", requires = "nvim-treesitter/nvim-treesitter" }
end

local function treesitter(use)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      if vim.fn.exists(":TSUpdate") == 2 then
        vim.cmd([[:TSUpdate]])
      end
    end,
  }
  use {
    "nvim-treesitter/nvim-treesitter-context",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  }
  use { "nvim-treesitter/playground", requires = {
    "nvim-treesitter/nvim-treesitter",
  } }
end

local function debugger(use)
  use {
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
  }
end

local function trouble(use)
  use {
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "folke/lsp-colors.nvim",
    },
  }
  use {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {}
    end,
  }
end

-- Older, pure vim, plugins
local function classic(use)
  use("tpope/vim-eunuch")
  use("bruxisma/gitmoji.vim")
  use("airblade/vim-gitgutter")
  use { "shinchu/lightline-gruvbox.vim", requires = "itchyny/lightline.vim" }
end

return function(use)
  use { "wbthomason/packer.nvim" }
  use { "gruvbox-community/gruvbox" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }
  --use { "github/copilot.vim" }
  use { "neovim/nvim-lspconfig" }

  treesitter(use)
  completion(use)
  telescope(use)
  languages(use)
  debugger(use)
  trouble(use)
  classic(use)
end

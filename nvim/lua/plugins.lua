local fn = vim.fn

local function bootstrap()
  local destination = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(destination)) > 0 then
    fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      destination,
    }
    vim.cmd.packadd("packer.nvim")
    return true
  end
  return false
end

local bootstrapped = bootstrap()
return require("packer").startup {
  function(use)
    use { "wbthomason/packer.nvim", opt = false }
    use { "ellisonleao/gruvbox.nvim" }
    use { "ojroques/nvim-osc52" }
    use { "rcarriga/nvim-notify" }

    use {
      "williamboman/mason-lspconfig.nvim",
      requires = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
    }

    -- non-lua plugins
    use { "tpope/vim-eunuch" } -- TODO: check if this can be replaced with telescope-file-browser
    use { "bruxisma/gitmoji.vim" } -- TODO: Rewrite in lua
    use { "airblade/vim-gitgutter" } -- TODO: Replace with gitsigns.nvim
    -- TODO: Replace with some other statusline plugin
    use { "shinchu/lightline-gruvbox.vim", requires = "itchyny/lightline.vim" }

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "IndianBoy42/tree-sitter-just" },
        { "nvim-treesitter/playground" },
      },
      run = function()
        local update = require("nvim-treesitter.install").update { with_sync = true }
        update()
      end,
    }

    -- searching
    use {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" },
        { "nvim-telescope/telescope-github.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } },
        { "nvim-telescope/telescope-packer.nvim", requires = { "wbthomason/packer.nvim" } },
        -- { "nvim-telescope/telescope-ui-select.nvim" },
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = { "cmake --preset ninja", "cmake --build build --target install" },
        },
      },
      config = function()
        local telescope = require("telescope")
        telescope.setup {}
        telescope.load_extension("file_browser")
        telescope.load_extension("packer")
        telescope.load_extension("fzf")
        telescope.load_extension("dap")
        telescope.load_extension("gh")
      end,
    }

    -- diagnostics
    use {
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "folke/lsp-colors.nvim" },
    }
    use {
      "folke/todo-comments.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("todo-comments").setup {}
      end,
    }

    -- LSP
    use { "simrat39/rust-tools.nvim" }
    use { "folke/neodev.nvim", requires = { "hrsh7th/nvim-cmp" } }
    use { "ray-x/go.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }

    -- DAP
    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end,
    }

    -- completions
    use {
      "hrsh7th/nvim-cmp",
      --event = "InsertEnter",
      requires = {
        { "dcampos/cmp-snippy", requires = "dcampos/nvim-snippy" },
        -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
        -- { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        -- { "hrsh7th/cmp-cmdline" },
        -- { "hrsh7th/cmp-buffer" },
        -- { "hrsh7th/cmp-path" },
        -- { "lukas-reineke/cmp-under-comparator" },
        { "onsails/lspkind.nvim" },
      },
    }

    -- evaluating
    -- { "windwp/nvim-autopairs" }
    -- { "hkupty/iron.nvim" }
    -- { "danymat/neogen" }
    -- { "ray-x/lsp_signature.nvim" }
    -- { "p00f/clangd_extensions.nvim" }
    -- { "nvim-lualine/lualine.nvim" }

    if bootstrapped then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = fn.stdpath("cache") .. "/packer.nvim/plugin/compiled.lua",
    display = {
      error_sym = "❌",
      done_sym = "✅",
      removed_sym = "➖",
      moved_sym = "➡",
    },
  },
}

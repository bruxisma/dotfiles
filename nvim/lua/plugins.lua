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

local function setup(name)
  return function()
    local exists, module = pcall(require, name)
    if not exists then
      return
    end
    pcall(module, "setup", {})
  end
end

local bootstrapped = bootstrap()
return require("packer").startup {
  function(use)
    use { "gruvbox-community/gruvbox" } -- replace with gruvbox.nvim
    use { "nvim-lua/popup.nvim" }
    use { "neovim/nvim-lspconfig" }

    -- non-lua plugins
    use { "tpope/vim-eunuch" } -- TODO: check if this can be replaced with telescope-file-browser
    use { "bruxisma/gitmoji.vim" } -- TODO: Rewrite in vim
    use { "airblade/vim-gitgutter" } -- TODO: Replace with gitsigns.nvim
    -- TODO: Replace with some other statusline plugin
    use { "shinchu/lightline-gruvbox.vim", requires = "itchyny/lightline.vim" }

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
        { "IndianBoy42/tree-sitter-just" },
        {
          "nvim-treesitter/playground",--[[, cmd = "TSPlaygroundToggle" ]]
        },
      },
      run = vim.cmd.TSUpdate,
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
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = { "cmake --preset ninja", "cmake --build build --target install" },
        },
      },
      config = function()
        local telescope = require("telescope")
        -- TODO: Investigate non-default extension settings
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
    use { "folke/neodev.nvim", after = "hrsh7th/nvim-cmp" }
    use { "ray-x/go.nvim" }

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
      requires = {
        { "dcampos/cmp-snippy", requires = "dcampos/nvim-snippy" },
      },
    }

    if bootstrapped then
      require("packer").sync()
    end
  end,
  config = {
    compile_path = fn.stdpath("cache") .. "packer.nvim/compiler.lua",
    display = {
      error_sym = "❌",
      done_sym = "✅",
      removed_sym = "➖",
      moved_sym = "➡",
    },
  },
}

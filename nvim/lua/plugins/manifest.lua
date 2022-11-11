local function telescope(use)
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-symbols.nvim", requires = { "nvim-telescope/telescope.nvim" } }
  use { "nvim-telescope/telescope-packer.nvim", requires = {
    "nvim-telescope/telescope.nvim",
    "wbthomas/packer.nvim",
  }}
  use { "nvim-telescope/telescope-github.nvim", requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  }}
end

local function languages(use)
  use { "simrat39/rust-tools.nvim", requires = "neovim/nvim-lspconfig" }
  use { "ray-x/go.nvim" }
  use { "IndianBoy42/tree-sitter-just", requires = "nvim-treesitter/nvim-treesitter" }
end

-- Older, pure vim, plugins
local function classic(use)
  use "tpope/vim-eunuch"
  use "bruxisma/gitmoji.vim"
  use "airblade/vim-gitgutter"
  use { "shinchu/lightline-gruvbox.vim", requires = "itchyny/lightline.vim" }
end

return function(use)
  use { "wbthomason/packer.nvim" }
  use { "gruvbox-community/gruvbox" }
  use { "nvim-treesitter/nvim-treesitter", run = function()
    if vim.fn.exists(':TSUpdate') == 2 then
      vim.cmd [[:TSUpdate]]
    end
  end}
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "github/copilot.vim" }
  use { "neovim/nvim-lspconfig" }
  use { "folke/trouble.nvim", requires = {
    "kyazdani42/nvim-web-devicons",
    "folke/lsp-colors.nvim",
  }}
  use { "hrsh7th/nvim-cmp" }
  use { "theHamsta/nvim-dap-virtual-text", requires = {
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
  }}

  telescope(use)
  languages(use)
  classic(use)
end

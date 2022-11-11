local fn = vim.fn
local packer = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer)) > 0 then
  local bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install,
  }
end

local function plugins(use)
  --[[ use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function() require("telescope").load_extension("frecency") end,
    requires = "tami5/sqlite.lua",
  } ]]
  use "wbthomason/packer.nvim"
  use "github/copilot.vim"
  use "neovim/nvim-lspconfig"
  use {
    "gruvbox-community/gruvbox",
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    --commit = "668de0951a36ef17016074f1120b6aacbe6c4515",
  }
  use "folke/lsp-colors.nvim"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
  use {
    "nvim-telescope/telescope-symbols.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
  }
  use {
    "nvim-telescope/telescope-packer.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "wbthomason/packer.nvim" },
    },
  }
  use {
    "nvim-telescope/telescope-github.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
  }
  use {
    "simrat39/rust-tools.nvim",
    requires = {
      {
        "neovim/nvim-lspconfig",
      },
    },
  }

  -- The following plugins are taken from my old vimrc
  use "tpope/vim-eunuch"
  use "bruxisma/gitmoji.vim"
  use {
    "airblade/vim-gitgutter",
  }
  use {
    "shinchu/lightline-gruvbox.vim",
    requires = "itchyny/lightline.vim",
  }

  use {
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
  }
  use "ray-x/go.nvim"
  use {
    "ray-x/navigator.lua",
    requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  }

  use 'hrsh7th/nvim-cmp'

  if bootstrap then
    require("packer").sync()
  end
end

require("packer").startup {
  plugins,
  config = {
    compile_path = require("packer.util").join_paths(
      vim.fn.stdpath "cache",
      "packer.nvim",
      "compiled.lua"
    ),
    display = {
      error_sym = "❌",
      done_sym = "✅",
      removed_sym = "➖",
      moved_sym = "➡",
    },
  },
}

require "settings.options"
require "settings.keymaps"
require "settings.autocmd"
--require "settings.abbrev"

--[[
Section Below is because there is a bug with packer where the `config` field is
ignored entirely for some reason
]]

-- lightline.vim plugin
vim.cmd [[
  let g:lightline =<< trim STATUS
    #{
        colorscheme: 'gruvbox',
        active: #{
          left: [
            ['mode', 'paste'],
            ['readonly', 'filename', 'modified']
          ]
        },
        component : #{ lineinfo: "\ue0a1 %3l:%-2v" },
        component_function : #{
          readonly: 'LightlineReadonly',
        },
        separator: #{ left: "\ue0b0", right: "\ue0b2" },
        subseparator: #{ left: "\ue0b1", right: "\ue0b3" }
     }
  STATUS
  let g:lightline = eval(join(g:lightline))
]]

-- gruvbox
vim.g.gruvbox_contrast_dark = "hard"

-- vim-gitgutter plugin
vim.cmd [[
  let g:gitgutter_sign_removed_first_line = "\uf476"
  let g:gitgutter_sign_modified_removed = "\uf45a"
  let g:gitgutter_sign_modified = "\uf459"
  let g:gitgutter_sign_removed = "\uf458"
  let g:gitgutter_sign_added = "\uf457"
]]

vim.g.gitgutter_map_keys = 0
if vim.fn.executable "rg" then
  vim.g.gitgutter_grep = "rg --color never"
end

-- treesitter
local treesitter = require "nvim-treesitter.configs"
treesitter.setup {
  ensure_installed = "maintained",
  highlight = {
    additional_vim_regex_highlighting = { "dockerfile" },
    enable = true,
    disable = { "dockerfile" },
    incremental_selection = { enable = true },
    indent = { enable = true, disable = { "lua" } },
  },
}

-- nvim-lspconfig
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").gopls.setup {}
-- rust-tools.nvim
require("rust-tools").setup {}
-- ray-x/go.nvim
require("nvim-dap-virtual-text").setup {}
require("go").setup {lsp_gofumpt = true}
require("navigator").setup {}

require("telescope").setup {}

require("telescope").load_extension("packer")
require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")

vim.api.nvim_exec([[
augroup golang
  autocmd!
  autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
augroup END
]], false)

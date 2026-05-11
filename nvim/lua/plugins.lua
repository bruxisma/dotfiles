-- Old completion confiruation so I can move to blink.cmp fully later on.
--local plugins = {
--  -- completions
--  {
--    "hrsh7th/nvim-cmp",
--    config = require("completions"),
--    opts = {},
--    dependencies = {
--      { "dcampos/cmp-snippy", dependencies = { "nvim-snippy" } },
--      "hrsh7th/cmp-nvim-lsp-signature-help",
--      "hrsh7th/cmp-nvim-lua",
--      "hrsh7th/cmp-omni",
--      "hrsh7th/cmp-nvim-lsp",
--      { "onsails/lspkind.nvim", lazy = true },
--    },
--  }
--}

local prelude = package.loaded.prelude

local function modified()
  if vim.bo.modified then
    return ""
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return ""
  end
  return ""
end

-- TODO: https://github.com/sindrets/diffview.nvim

vim.pack.add({
  {
    name = "gitsigns",
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = "v2.1.0",
    data = {
      configuration = {
        signs = {
          changedelete = { text = "" },
          delete = { text = "" },
          change = { text = "" },
          add = { text = "" },
        },
      },
    },
  },
  {
    name = "lualine",
    src = "https://github.com/nvim-lualine/lualine.nvim",
    data = {
      configuration = {
        -- TODO: Look into moving to this style 🙂‍↕️
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
        theme = "gruvbox",
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
            { vim.ui.progress_status },
            { "filename", file_status = false },
            { modified },
          },
          lualine_c = {},
        },
      },
    },
  },

  -- Nice to haves
  -- TODO: Find a replacement, this is now archived
  {
    name = "dressing",
    src = "https://github.com/stevearc/dressing.nvim",
  },
  {
    src = "https://github.com/tpope/vim-eunuch",
    name = "eunuch",
    data = {
      commands = { "Mkdir", "Rename", "Delete" },
      skipsetup = true
    }
  },
  {
    src = "https://github.com/folke/trouble.nvim", name = "trouble",
    data = {
      commands = { "Trouble", "TodoTrouble" },
    }
  },
  {
    name = "todo-comments",
    src = "https://github.com/folke/todo-comments.nvim",
  },
  {
    name = "no-neck-pain",
    src = "https://github.com/shortcuts/no-neck-pain.nvim",
  },
  {
    name = "telescope",
    src = "https://github.com/nvim-telescope/telescope.nvim",
    data = {
      configuration = {
        extensions = {
          file_browser = { hijack_netrw = true },
          notify  = { },
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
    },
  },
  {
    name = "blink",
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1"),
    data = { module = "blink.cmp" }
  },

  -- haven't used this in some time... do I need it?
  {
    name = "mason",
    src = "https://github.com/mason-org/mason.nvim",
    data = {
      configuration = {
        ui = {
          icons = {
            package_uninstalled = "○",
            package_installed = "●"
          },
        },
      },
    },
  },
  -- now archived... here still because of dependencies
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    version = "main",
  },
  -- lsp
  {
    name = "lsp-endhints",
    src = "https://github.com/chrisgrieser/nvim-lsp-endhints",
  },
  -- Filetype
  {
    name = "gitmoji",
    src = "https://github.com/bruxisma/gitmoji.vim",
    data = {
      filetype = "gitcommit",
      skipsetup = true,
    },
  },
  {
    name = "render-markdown",
    src = "https://github.com/MeanderingProgrammer/markdown.nvim",
    data = { filetype = "markdown" }
  },
  {
    name = "sfz",
    src = "https://github.com/sfztools/sfz.vim",
    data = {
      filetype = "sfz",
      skipsetup = true,
    }
  },
})

-- builtins
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

prelude.packages():filter(prelude.normative):map(prelude.setup):totable()

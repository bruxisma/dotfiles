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
  highlight = {
    additional_vim_regex_highlighting = { "dockerfile", "cmake" },
    enable = true,
    disable = { "dockerfile" },
    incremental_selection = { enable = true },
    indent = { enable = true, disable = { "lua" } },
  },
}

---- nvim-lspconfig
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").gopls.setup {}
---- rust-tools.nvim
require("rust-tools").setup {}
---- ray-x/go.nvim
require("nvim-dap-virtual-text").setup {}
require("go").setup {lsp_gofumpt = true}
--
require("tree-sitter-just").setup {}
--
require("telescope").setup {}

require("telescope").load_extension("packer")
require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")

require "settings.options"
require "settings.keymaps"
require "settings.autocmd"
--require "settings.abbrev"

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local options = { noremap = true, silent = true, buffer = bufnr }
  -- override C-] to jump to definitions
  vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, options)
end

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

-- nvim-lspconfig
require("lspconfig").rust_analyzer.setup {on_attach = on_attach}
require("lspconfig").clangd.setup {on_attach = on_attach}
require("lspconfig").gopls.setup {on_attach = on_attach}
-- rust-tools.nvim
require("rust-tools").setup {}
-- ray-x/go.nvim
require("nvim-dap-virtual-text").setup {}
require("go").setup {lsp_gofumpt = true}
--
require("tree-sitter-just").setup {}
--
require("telescope").setup {}

require("telescope").load_extension("packer")
require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")

require("todo-comments").setup {}

-- completion
require('snippy').setup{
  mappings = {
    is = {
      ['<Tab>'] = 'expand_or_advance',
      ['<S-Tab>'] = 'previous',
    },
  },
}
require("cmp").setup {
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end
  },
  mapping = require("cmp").mapping.preset.insert({
    ['<CR>'] = require("cmp").mapping.confirm({select = true}),
  }),
  sources = require('cmp').config.sources({
    { name = 'snippy' },
  })
}

return function()
  local lspkind = require("lspkind")
  local snippy = require("snippy")
  local cmp = require("cmp")
  cmp.setup {
    snippet = {
      expand = function(args)
        snippy.expand_snippet(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format {},
    },
    mapping = cmp.mapping.preset.insert {
      ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources {
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "snippy" },
      { name = "omni" },
    },
  }
end

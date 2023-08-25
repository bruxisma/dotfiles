local poetry = {}

-- TODO: Consider just moving this into a separate file so we can have a proper
-- constructor, and the root path is installed into said object.
function poetry:is_installed(path)
  local options = { path = path, type = "file", limit = 2 }
  -- both files must exist or else `poetry install` was never run
  return #vim.fs.find({ "poetry.lock", "pyproject.toml" }, options) == 2
end

-- yes, the %s is *not* really all that safe because of how regex work. Oh well.
function poetry:has_package(root, name)
  local content = vim.fn.readfile(string.format("%s/pyproject.toml", root))
  return vim.fn.match(content, string.format("^%s\\s\\+=", name)) ~= -1
end

local function on_attach(client, buffer)
  local options = { noremap = true, silent = true, buffer = buffer }
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, options)

  -- TODO: Consider using our *own* keymaps instead of the nvim-lspconfig
  -- recommended ones 👀
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

  -- diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
end

return function()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    on_new_config = function(cfg, root)
      if not poetry:is_installed(root) then
        return
      end
      if not poetry:has_package(root, "pyright") then
        return
      end
      cfg.cmd = { "poetry", "run", "pyright-langserver", "--stdio" }
    end,
  }

  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    before_init = require("neodev.lsp").before_init,
    settings = {
      Lua = {
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        diagnostics = { globals = { "vim" } },
      },
    },
  }
end


--require("rust-tools").setup {
--  server = {
--    capabilities = capabilities,
--    on_attach = on_attach,
--    settings = {
--      ["rust-analyzer"] = {
--        inlayHints = { locationLinks = false },
--      },
--    },
--  },
--}

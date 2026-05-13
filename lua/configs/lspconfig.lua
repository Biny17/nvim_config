require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls", "gopls", "pylsp" }
-- Broadcast cmp capabilities to ALL servers globally
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable(servers)

vim.diagnostic.config({
  virtual_text = {
    suffix = " (...)", -- shown when the message is truncated
  },float = {
    wrap = true,      -- Enable line wrapping in the float
    max_width = 80,   -- Optional: cap the float width
  },
})

-- read :h vim.lsp.config for changing options of lsp servers 

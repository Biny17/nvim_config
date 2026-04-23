require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls", "gopls" }
-- Broadcast cmp capabilities to ALL servers globally
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Let mason-lspconfig auto-enable Mason-installed servers
require("mason-lspconfig").setup()

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

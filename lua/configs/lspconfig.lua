require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls", "gopls", "pylsp" }
-- Broadcast cmp capabilities to ALL servers globally
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

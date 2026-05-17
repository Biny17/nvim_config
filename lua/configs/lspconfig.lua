require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "tailwindcss", "eslint", "clangd", "lua_ls", "gopls", "pylsp" }
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
vim.lsp.config("cssls", {
  settings = {
    css = { lint = { unknownAtRules = "ignore" } },
    scss = { lint = { unknownAtRules = "ignore" } },
  },
})

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html", "css",
    "javascript", "typescript",
    "javascriptreact", "typescriptreact",
  },
})

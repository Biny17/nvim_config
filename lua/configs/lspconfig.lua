require("nvchad.configs.lspconfig").defaults()

-- Broadcast cmp capabilities to ALL servers globally
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
  float = {
    wrap = true,
    max_width = 80,
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
vim.lsp.config("cssls", {
  settings = {
    css = { lint = { unknownAtRules = "ignore" } },
    scss = { lint = { unknownAtRules = "ignore" } },
  },
})

vim.lsp.config("html", {
  filetypes = { "html", "templ" },
})

vim.lsp.config("tailwindcss", {
  filetypes = {
    "html", "css", "templ",
    "javascript", "typescript",
    "javascriptreact", "typescriptreact",
  },
  settings = {
    tailwindCSS = {
      includeLanguages = { templ = "html" },
    },
  },
})

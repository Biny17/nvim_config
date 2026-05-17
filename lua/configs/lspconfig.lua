require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- existing
  "html", "cssls", "clangd", "lua_ls", "gopls", "pylsp",
  -- next.js / react / tailwind / typescript
  "ts_ls", "tailwindcss", "eslint", "jsonls",
}

vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- tsls: enable tsx/jsx support explicitly
vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  settings = {
    typescript = { inlayHints = { includeInlayParameterNameHints = "all" } },
  },
})

-- tailwindcss: extend to ts/tsx files (not just html/css)
vim.lsp.config("tailwindcss", {
  filetypes = {
    "html", "css",
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
  },
})

-- eslint: auto-fix on save
vim.lsp.config("eslint", {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

vim.lsp.enable(servers)

vim.diagnostic.config({
  virtual_text = {
    suffix = " (...)",
  },
  float = {
    wrap = true,
    max_width = 60,
  },
})

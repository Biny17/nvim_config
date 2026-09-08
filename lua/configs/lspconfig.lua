require("nvchad.configs.lspconfig").defaults()

-- Broadcast cmp capabilities to ALL servers globally
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
  float = {
    wrap = true,
    max_width = 80,
  },
}

-- NvChad's on_attach does not map K to hover, so add the missing LSP mappings here
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = "LSP " .. desc })
    end
    map("K", vim.lsp.buf.hover, "Hover")
    map("<A-k>", vim.lsp.buf.signature_help, "Signature help")
  end,
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
    "html",
    "css",
    "templ",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  settings = {
    tailwindCSS = {
      includeLanguages = { templ = "html" },
    },
  },
})

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          vim.lsp.enable(server_name)
        end,
      })
    end,
  },
}

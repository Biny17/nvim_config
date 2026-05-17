-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@class ChadrcConfig
local M = {}

M.mason = {
  pkgs = {
    -- LSP
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "tailwindcss-language-server",
    "eslint-lsp",
    -- formatters
    "prettier",
    -- already had these
    "lua-language-server",
    "clangd",
    "gopls",
    "python-lsp-server",
  },
}

M.base46 = {
	theme = "horizon",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M

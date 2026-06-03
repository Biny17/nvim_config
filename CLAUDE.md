# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built on top of [NvChad v2.5](https://github.com/NvChad/NvChad). NvChad itself is loaded as a lazy.nvim plugin, so its defaults (options, mappings, autocmds, LSP configs) are extended — not replaced — from the files here.

## Formatting

Lua files are formatted with **StyLua**. Config is in `.stylua.toml`: 120-column width, 2-space indentation, double-quote preference. Run before committing:

```sh
stylua lua/ init.lua
```

## Architecture

### Entry point

`init.lua` bootstraps lazy.nvim, loads NvChad as a plugin, then requires `options`, `autocmds`, and `mappings`. It also sets global vim options directly (relative numbers, clipboard, scrolloff, `templ` filetype, etc.).

### Key config files

| File | Purpose |
|---|---|
| `lua/chadrc.lua` | NvChad overrides — theme (`flouromachine`), Mason package list |
| `lua/configs/lspconfig.lua` | LSP server configs; capabilities injected globally via `cmp_nvim_lsp` |
| `lua/configs/conform.lua` | Format-on-save via conform.nvim (prettier, stylua, goimports handled separately by go.nvim) |
| `lua/configs/lazy.lua` | lazy.nvim performance/UI settings |
| `lua/mappings.lua` | Custom keymaps on top of `nvchad.mappings` |
| `lua/autocmds.lua` | Delegates to `nvchad.autocmds` (extend here as needed) |
| `lua/options.lua` | Delegates to `nvchad.options` (extend here as needed) |

### Plugin files (`lua/plugins/`)

Each file returns a lazy.nvim plugin spec table. `lua/plugins/init.lua` is the main one (conform, nvim-lspconfig, treesitter). Other files are auto-imported by `{ import = "plugins" }` in `init.lua`.

Notable plugins:
- **mason-lspconfig** (`mason-lspconfig.lua`) — bridges Mason and nvim-lspconfig; `gopls`, `lua_ls`, `clangd`, `pylsp` etc. are installed via `chadrc.lua` Mason pkgs list
- **go.nvim** (`go.lua`) — Go tooling; `lsp_cfg = false` because gopls is managed by mason-lspconfig; runs `goimports` on save
- **obsidian.nvim** (`obsidian.lua`) — note-taking; vault at `~/Notes`; lazy-loaded on markdown filetype
- **completions** (`completions.lua`) — nvim-cmp with luasnip; lspkind for icons
- **image.nvim**, **notify**, **flash**, **surround**, **multicursor**, **autotag**, **gitgraph** — misc enhancements

### LSP setup pattern

`lspconfig.lua` uses the new `vim.lsp.config("server", {...})` API (Neovim 0.11+). Capabilities are broadcast to all servers globally with `vim.lsp.config("*", {...})`. Server-specific tweaks (cssls, html, tailwindcss) are also in this file. The `templ` filetype is supported via html and tailwindcss LSP filetypes overrides.

### Branch structure

- `main` — baseline config
- `ubuntu` — Ubuntu-specific variant (current working branch)
- `yota` — another machine variant

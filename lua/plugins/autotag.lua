return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    opts = {
      enable_close = true,          -- auto-close tags on completion
      enable_rename = true,         -- rename closing tag when opening tag is edited
      enable_close_on_slash = true, -- close on </
    },
    aliases = {
      ["typescript.tsx"] = "tsx",
      ["javascript.jsx"] = "jsx",
    },
  },
}

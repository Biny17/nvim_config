return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Notes",
      },
    },

    -- Optional: configure the completion provider
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Optional: use telescope for search (NvChad ships telescope)
    picker = {
      name = "telescope.nvim",
    },

    -- Follow links with <CR> in normal mode
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,

    ui = {
      enable = true,
    },
  },

  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>",           desc = "Obsidian New note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>",          desc = "Obsidian Open in app" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",   desc = "Obsidian Find note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>",        desc = "Obsidian Search" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",     desc = "Obsidian Backlinks" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>",          desc = "Obsidian Tags" },
    { "<leader>od", "<cmd>ObsidianToday<cr>",         desc = "Obsidian Daily note" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>",         desc = "Obsidian Links" },
    { "<leader>oi", "<cmd>ObsidianPasteImg<cr>",      desc = "Obsidian Paste image" },
    { "<leader>or", "<cmd>ObsidianRename<cr>",        desc = "Obsidian Rename note" },
  },
}

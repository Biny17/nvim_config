return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require "notify"

    notify.setup {
      background_colour = "#000000",
      render = "compact", -- minimal: "minimal" | bordered: "default" | "compact"
      stages = "fade", -- animation: "fade", "slide", "fade_in_slide_out", "static"
      timeout = 7000,
      max_width = 60,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    }

    -- Replace the default vim.notify with nvim-notify
    vim.notify = notify

    -- Show LSP progress messages (server start, indexing, etc.) via nvim-notify
    -- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    --   local value = result.value
    --   if not value or not value.kind then
    --     return
    --   end
    --   local msg = value.message or value.title or ""
    --   if value.kind == "begin" then
    --     vim.notify(("[LSP] %s"):format(msg), vim.log.levels.INFO, { title = "LSP" })
    --   end
    -- end
  end,
}

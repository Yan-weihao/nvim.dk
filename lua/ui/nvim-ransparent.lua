require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { --{ -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    --example of akinsho/nvim-bufferline.lua
    -- "nvim_tree_highlight",
    "Normal",
    "NvimTreeNormal",
    "NvimNotifyRefreshHighlights",
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
    "NotifyERRORBody",
    "NotifyWARNBody",
    "NotifyINFOBody",
    "NotifyDEBUGBody",
    "NotifyTRACEBody",
    "background_colour",
    "NotifyLogTime",
    "NotifyLogTitle",
 },
  exclude = { 
  }, -- table: groups you don't want to clear
})

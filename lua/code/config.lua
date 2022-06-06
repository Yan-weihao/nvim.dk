--catppuccin
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

--vim.g.transparent_enabled = ture

--bookmark
vim.cmd[[
          let g:bookmark_display_annotation = 1
          let g:bookmark_save_per_working_dir = 1
          let g:bookmark_auto_save = 1
]]
--notify
require("notify")("严伟浩欢迎你")

  vim.cmd([[
    hi default NotifyERRORBorder guifg=#8A1F1F guibg=#F70067
    hi default NotifyWARNBorder guifg=#79491D guibg=#F70067
    hi default NotifyINFOBorder guifg=#4F6752 guibg=#F70067
    hi default NotifyDEBUGBorder guifg=#8B8B8B guibg=#F70067
    hi default NotifyTRACEBorder guifg=#4F3552 guibg=#F70067
    hi default NotifyERRORIcon guifg=#F70067 guibg=#F70067
    hi default NotifyWARNIcon guifg=#F79000 guibg=#F70067
    hi default NotifyINFOIcon guifg=#A9FF68 guibg=#F70067
    hi default NotifyDEBUGIcon guifg=#8B8B8B guibg=#F70067
    hi default NotifyTRACEIcon guifg=#D484FF guibg=#F70067
    hi default NotifyERRORTitle  guifg=#F70067 guibg=#F70067
    hi default NotifyWARNTitle guifg=#F79000 guibg=#F70067
    hi default NotifyINFOTitle guifg=#A9FF68 guibg=#F70067
    hi default NotifyDEBUGTitle  guifg=#8B8B8B guibg=#F70067
    hi default NotifyTRACETitle  guifg=#D484FF guibg=#F70067
    hi default link NotifyERRORBody Normal
    hi default link NotifyWARNBody Norma
    hi default link NotifyINFOBody Norma
    hi default link NotifyDEBUGBody Norma
    hi default link NotifyTRACEBody Norma

    hi default link NotifyLogTime Comment
    hi default link NotifyLogTitle Special
  ]])

vim.cmd([[
  augroup NvimNotifyRefreshHighlights
    autocmd!
    autocmd ColorScheme * lua require('ui.highlights').setup()
  augroup END
]])

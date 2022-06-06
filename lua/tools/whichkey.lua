local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["p"] = {"<cmd>PackerSync<cr>","packer"},
  ["u"] = {"<cmd>UndotreeToggle<cr>", "撤销树"},
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "文件树" },
  ["r"] = {"<cmd>SymbolsOutline<cr>","函数树"},
  b = {
    name = "buffer",
    b = {"<cmd>BufferLinePick<cr>","选择缓冲区"},
    j = {"<cmd>BufferLineCycleNext<cr>","下个缓冲区"},
    k = {"<cmd>BufferLineCyclePrev<cr>","上个缓冲区"},
    J = {"<cmd>BufferLinePick<cr>","移动到下个缓冲区"},
    K = {"<cmd>BufferLinePick<cr>","移动到缓冲区"},
    e = {"<cmd>BufferLinePick<cr>","递增排序缓冲区"},
    d = {"<cmd>BufferLinePick<cr>","递减排序缓冲区"},
    q = {"<cmd>Bdelete<cr>","关闭缓冲区"},
    Q = {"<cmd>Bwipeout<cr>","清除缓冲区"},
  },
  d = {
    name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    X = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    -- C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    T = { "<cmd>lua require'dapui'.toggle('sidebar')<cr>", "Toggle Sidebar" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  },
  t = {
    name = "term",
    t = {"<cmd>Term<cr>","水平打开"},
    v = {"<cmd>VTerm<cr>","垂直打开"},
    s = {"<cmd>TTerm<cr>","新标签打开"},
    f = {"<cmd>ToggleTerm<cr>","浮动打开"},
  },
  f = {
    name = "find",
    a = {"<cmd>Telescope<cr>","打开搜索引擎"},
    f = {"<cmd>Telescope find_files<cr>","搜索当前目录的文件"},
    p = {"<cmd>Telescope projects<cr>","项目管理"},
    h = {"<cmd>Telescope oldfiles<cr>","搜索历史打开文件"},
    S = {"<cmd>Telescope live_greg<cr>","搜索当前目录下的字符串"},
    s = {"<cmd>Telescope grep_string<cr>","搜索光标下的字符串"},
    t = {"<cmd>Telescope frecency<cr>","按照频率搜索"},
    m = {
      name = "bookmark",
      a = {"<cmd>Telescope vim_bookmarks all<cr>","全部标签"},
      f = {"<cmd>Telescope vim_bookmarks current_file<cr>","当前文件标签"},
    },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "下一个Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "上一个Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "预览Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "重置Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "重置Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "撤销 Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "打开更改文件" },
    b = { "<cmd>Telescope git_branches<cr>", "查看分支" },
    c = { "<cmd>Telescope git_commits<cr>", "查看提交" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(相对于当前文件)",
    },
    d = {"<cmd>DiffviewOpen<cr>","Git Diff"},
    D = {"<cmd>DiffviewClose<cr>","Git Diff"},
  },
  j = {
    name = "Jump",
    w = { "<cmd>HopWord<cr>", "按照单词跳" },
    c = { "<cmd>HopChar1<cr>", "按照单个字母跳" },
    C = { "<cmd>HopChar2<cr>", "按照字母键跳" },
    l = { "<cmd>HopLine<cr>", "按照行跳" },
    L = { "<cmd>HopLineStart<cr>", "按照句子开头跳" },
    p = { "<cmd>HopPattern<cr>", "输入单词跳" }
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "缓冲区诊断" },
    w = { "<cmd>Telescope diagnostics<cr>", "诊断" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      vim.diagnostic.goto_next,
      "下一个诊断",
    },
    k = {
      vim.diagnostic.goto_prev,
      "上一个诊断",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    p = {
      name = "Peek",
      d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "定义" },
      t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "定义类型" },
      i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "执行" },
    },
    q = { vim.diagnostic.setloclist, "快速解决" },
    r = { vim.lsp.buf.rename, "重命名" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "文档符号" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "工作区符号",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope 快速修复" },
  },

}

which_key.setup(setup)
which_key.register(mappings, opts)

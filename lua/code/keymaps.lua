local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--buffer
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opts)

--debug
--设置断点
keymap("n", "<F2>", "<cmd>lua require'dap'.toggle_breakpoint(); require'completion.dap.dap-util'.store_breakpoints(true)<cr>", opts)
keymap("n", "<F3>", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<F12>", "lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"completion.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
--单步调试
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
--进入函数
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
--退出函数
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

--align
vim.cmd[[
xmap gh <Plug>(EasyAlign)
nmap gh <Plug>(EasyAlign)
]]
--jk
vim.cmd[[
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
]]
--eft
vim.cmd([[
  nmap ; <Plug>(eft-repeat)
  xmap ; <Plug>(eft-repeat)
  omap ; <Plug>(eft-repeat)

  nmap f <Plug>(eft-f)
  xmap f <Plug>(eft-f)
  omap f <Plug>(eft-f)
  nmap F <Plug>(eft-F)
  xmap F <Plug>(eft-F)
  omap F <Plug>(eft-F)
  
  nmap t <Plug>(eft-t)
  xmap t <Plug>(eft-t)
  omap t <Plug>(eft-t)
  nmap T <Plug>(eft-T)
  xmap T <Plug>(eft-T)
  omap T <Plug>(eft-T)
]])
--hop
vim.cmd([[
  nmap ; <Plug>(eft-repeat)
  xmap ; <Plug>(eft-repeat)
  omap ; <Plug>(eft-repeat)

  nmap f <Plug>(eft-f)
  xmap f <Plug>(eft-f)
  omap f <Plug>(eft-f)
  nmap F <Plug>(eft-F)
  xmap F <Plug>(eft-F)
  omap F <Plug>(eft-F)
  
  nmap t <Plug>(eft-t)
  xmap t <Plug>(eft-t)
  omap t <Plug>(eft-t)
  nmap T <Plug>(eft-T)
  xmap T <Plug>(eft-T)
  omap T <Plug>(eft-T)
]])

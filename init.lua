--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||         OR         ||   | === |          ========
========         ||  PunchStart.nvim   ||   |-----|          ========
========         ||                    ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |========:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

--     NOTE:  for help -> <space>sh for telescope search help
--    :help lua-guide or https://neovim.io/doc/user/lua-guide.html
--    https://github.com/nvim-lua/kickstart.nvim/pull/47
--    https://github.com/nvim-lua/kickstart.nvim/issues/217

--    Git clone this repo to reinstall: 
--    https://github.com/librepunk/PunchStart.nvim

--]]

--  NOTE: Must map leader before plugins are loaded (otherwise wrong one will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--[[ Setting options ]]
-- vim.opt.shell = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
-- vim.g.shell = 'pwsh'
-- vim.opt.shellcmdflag = {"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"}
-- vim.opt.shellredir = { '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode' }
-- vim.opt.shellpipe = { '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode' }
-- vim.opt.shellquote = { ' shellxquote=' }

--[[ --{{ Set up working powershell }}--
--
--

let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
set shellquote= shellxquote=
]]
--

-- Gui Options:
vim.opt.guifont = 'MonaspiceRn Nerd Font Mono:calt:1:fina:1:liga:1:ss01:1:ss02:1:ss03:1:ss05:1:ss06:1:ss07:1:ss08:1:ss09:1:size:14'
-- Visuals
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
-- Cmp Menus
vim.opt.wildmode = 'longest:full'
vim.opt.wildoptions:prepend 'fuzzy'
-- Mouse
-- vim.opt.mouse = 'a'
vim.opt.mouse = ''
-- Clipboard Syncing -> faster startup
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- vim.opt.list = true
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Tab size , def need it half the default
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 0
vim.opt.linebreak = true
vim.opt.cpoptions:append 'c'

--[[ Basic Keymaps ]]
--
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal -> changed from <C-\><C-n>,
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split nav (window commands)
vim.keymap.set('n', '<Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab nav
vim.keymap.set('n', '<C-Up>', 'gT', { desc = 'Move to the previous tab' })
vim.keymap.set('n', '<C-Down>', 'gt', { desc = 'Move to the next tab' })

-- not sure what for
-- vim.keymap.set('n', '', '0cf vim.opt.f=s = ',{})

--[[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- {{ Install `lazy.nvim` plugin manager }}
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--[[ Configure and install plugins ]]
--  To check the current status of your plugins, run
--    :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({

  -- Disable checker cuz i never got wifi
  checker = {
    enabled = false,
  },

  { import = 'plugins.init' },
  { import = 'plugins' },

  -- local scnvim = require('scnvim')
  -- scnvim.setup({
  --   sclang = {
  --     cmd = 'C:/Program Files/SuperCollider-3.13.0/sclang.exe'
  --   },
  -- })
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

-- See the kickstart.nvim README for more information
return {

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'retrobox'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
      -- kinda nice cursorline highlight
      vim.cmd.hi 'CursorLine cterm=bold,italic,underline ctermfg=132 ctermbg=234 gui=bold,italic,underline guifg=#b16286 guibg=#uu0c1c1c'
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- nVim inside browser
  -- 'glacambre/firenvim',
  -- build = ':call firenvim#install(0)',

  --[[WRITING SHIT]]
  -- more for prose
  'junegunn/limelight.vim',
  'junegunn/goyo.vim',
  -- possibly more coding vibes
  'folke/twilight.nvim',
  'folke/zen-mode.nvim',
  --[[ note apps , look up b4 install! ]]
  -- https://github.com/nvim-neorg/neorg/wiki/Kickstart
  -- https://neovimcraft.com/plugin/epwalsh/obsidian.nvim/
  { import = 'plugins' },
}

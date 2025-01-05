-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle current reveal_force_cwd<CR>', desc = 'Neotree reveal', silent = true },
    { '<C-|>', ':Neotree open_split current reveal_force_cwd<CR>', desc = 'Neotree reveal', silent = true },
    { '<Leader>nb', ':Neotree toggle show buffers right<CR>', desc = 'Reveal buffers', silent = true },
    { '<Leader>ns', ':Neotree float git_status<CR>', desc = 'Reveal git status', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
        },
      },
    },
  },
  source_selector = {
    winbar = false,
    statusline = true,
  },
}

--   nnoremap | :Neotree reveal<cr>
--   nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>

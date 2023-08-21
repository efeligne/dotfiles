return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        mode = 'tabs',
        buffer_close_icon = '󰅖',
        modified_icon = '',
        close_icon = '',
        left_trunc_marker = '󰁐',
        right_trunc_marker = '󱖘',
        always_show_bufferline = false,
        diagnostics = 'nvim_lsp',
      }
    })
  end
}

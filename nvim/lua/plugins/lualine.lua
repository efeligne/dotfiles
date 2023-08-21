return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
  },
  config = function()
    local section_separator = { left = '', right = '' }
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          { 'mode', separator = section_separator }
        },
        lualine_b = {
          { 'branch', separator = section_separator },
          { 'diff',   separator = section_separator },
        },
        lualine_c = { 'diagnostics', 'lsp_progress' },
        lualine_x = {
          'encoding',
          {
            'fileformat',
            symbols = {
              unix = 'LF',  -- e712
              dos = 'CRLF', -- e70f
              mac = 'CR',   -- e711
            }
          }
        },
        lualine_y = {
          {
            'filetype',
            icon_only = true,
            separator = section_separator
          },
          { 'filename', separator = section_separator }
        },
        lualine_z = {
          { 'progress', separator = section_separator },
          { 'location', separator = section_separator },
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}

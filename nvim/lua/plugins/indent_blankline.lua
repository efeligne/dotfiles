return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {},
  config = function()
    require('indent_blankline').setup({
      -- char_highlight_list = { "IndentBlankline" },
      -- context_highlight_list = { "IndentContext" },
      use_treesitter = true,
      show_current_context = true,
      show_current_context_start = true,
    })
    -- vim.cmd [[highlight IndentBlankline guifg=#1f2f3f gui=nocombine]]
    -- vim.cmd [[highlight IndentContext guifg=#4f5f6f gui=nocombine]]
  end
}

return {
  'svrana/neosolarized.nvim',
  dependencies = {
    'tjdevries/colorbuddy.vim',
  },
  opts = {},
  config = function()
    require('neosolarized').setup({
      comment_italics = true,
      background_set = false,
    })
  end
}

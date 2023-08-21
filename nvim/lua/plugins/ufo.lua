return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  opts = {},
  config = function()
    local ufo = require('ufo')
    ufo.setup({
      provider_selector = function(_, filetype, buftype)
        return (filetype == "" or buftype == "nofile") and "indent" or { "treesitter", "indent" }
      end
    })
  end
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = {},
  config = function()
    local cmp = require("cmp")
    local luasnip = require('luasnip')
    cmp.setup {
      snippet = {
        expand = function(args)
          if not luasnip then
            return
          end
          luasnip.lsp_expand(args.body)
        end
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(_, vim_item)
            return vim_item
          end
        })
      },
      mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    }
  end
}

---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ftt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle Transparency",
    },
    ["<leader>fth"] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle Theme",
    },
    ["+"] = { "<C-a>", "Increment" },
    ["-"] = { "<C-x>", "Decrement" },
    ["x"] = { '"_x', 'Do not yank with "x"' },
    ["<C-a>"] = { "ggVG", "Select All" },
    ["<C-s>"] = { "<cmd>w<cr>", "Save changes" },
    ["<A-up>"] = { "<cmd>m .-2<cr>==", "Move line Up" },
    ["<A-down>"] = { "<cmd>m .+1<cr>==", "Move line Down" },
    ["<Leader>ri"] = { "gg=G", "Reindent" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["x"] = { '"_x', 'Do not yank with "x"' },
    ["<A-up>"] = { ":m '<-2<CR>gv=gv", "Move line Up" },
    ["<A-down>"] = { ":m '>+1<CR>gv=gv", "Move line Down" },
  },
  i = {
    ["<A-up>"] = { "<Esc><cmd>m .-2<CR>==gi", "Move line Up" },
    ["<A-down>"] = { "<Esc><cmd>m .+1<CR>==gi", "Move line Down" },
  },
}

-- more keybinds!

return M

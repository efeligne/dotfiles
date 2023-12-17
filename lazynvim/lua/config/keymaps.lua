-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local handle = {}

function handle.mappings(mappings)
  for mode, mode_values in pairs(mappings) do
    for keybind, mapping_info in pairs(mode_values) do
      local opts = {}
      opts.desc = mapping_info[2]
      opts.silent = true
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end
end

local M = {
  n = {
    ["+"] = { "<C-a>", "Increment" },
    ["-"] = { "<C-x>", "Decrement" },
    ["x"] = { '"_x', 'Do not yank with "x"' },
    ["<C-a>"] = { "ggVG", "Select All" },
    ["<A-up>"] = { "<cmd>m .-2<cr>==", "Move line Up" },
    ["<A-down>"] = { "<cmd>m .+1<cr>==", "Move line Down" },
    ["<Leader>ri"] = { "gg=G", "Reindent" },
  },

  v = {
    ["x"] = { '"_x', 'Do not yank with "x"' },
    ["<A-up>"] = { ":m '<-2<CR>gv=gv", "Move line Up" },
    ["<A-down>"] = { ":m '>+1<CR>gv=gv", "Move line Down" },
  },

  i = {
    ["<A-up>"] = { "<Esc><cmd>m .-2<CR>==gi", "Move line Up" },
    ["<A-down>"] = { "<Esc><cmd>m .+1<CR>==gi", "Move line Down" },
  },
}

handle.mappings(M)

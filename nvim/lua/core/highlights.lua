local opt = vim.opt
local cmd = vim.cmd

opt.cursorline = true
opt.winblend = 0
opt.termguicolors = true
opt.wildoptions = 'pum'
opt.pumblend = 0

cmd.colorscheme('catppuccin-mocha')

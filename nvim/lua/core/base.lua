local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

cmd('autocmd!')

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

wo.number = true

g.mapleader = " "

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.foldcolumn = '0'
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

opt.title = true
opt.signcolumn = 'yes:1'
opt.autoindent = true
opt.breakindent = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.ai = true
opt.si = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10
opt.shell = 'zsh'
opt.backupskip = 'tmp/*,/private/tmp/*'
opt.inccommand = 'split'
opt.ignorecase = true
opt.wrap = false
opt.backspace = 'start,eol,indent'
opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/**' }

g.rustfmt_autosave = 1
g.loaded_perl_provider = 0

opt.spell = false
opt.spelllang = { 'en_us', 'ru_ru' }
opt.langmap = {
  'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  'фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
}

-- Undercurl. It doesn't work on Iterm2 by default.
-- This post might help to solve the problem:
-- https://dev.to/jibundit/undercurl-display-on-neoand-tmux-with-iterm2-3pi0
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

opt.formatoptions:append { 'r' }
opt.clipboard:append { 'unnamedplus' }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {}
local popen = io.popen
local pfile = popen('ls $HOME/.config/nvim/lua/plugins')

if (pfile ~= nil) then
  for node in pfile:lines() do
    local a = node:match "([^.]*).(.*)"
    table.insert(plugins, require('plugins.' .. a))
  end
  pfile:close()
end

require("lazy").setup(plugins)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("mason").setup()
vim.wo.relativenumber = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd("colorscheme everforest")

